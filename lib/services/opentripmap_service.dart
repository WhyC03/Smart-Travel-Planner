import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_travel_planner/services/unsplash_image_service.dart';
import '../models/place_model.dart';

class OpenTripMapPlaceService {
  // Paste API key here later
  static const String apiKey = 'PASTE_OPEN_TRIP_MAP_API_KEY_HERE';

  static const String _baseUrl = 'https://api.opentripmap.com/0.1/en/places';

  Future<List<PlaceModel>> fetchPlaces({
    required double lat,
    required double lon,
  }) async {
    final url =
        '$_baseUrl/radius?radius=20000&lat=$lat&lon=$lon'
        '&kinds=interesting_places&limit=10&format=json'
        '&apikey=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch places');
    }

    final List data = jsonDecode(response.body);

    List<PlaceModel> places = [];

    for (final item in data) {
      final name = item['name'] ?? 'Unknown';

      final imageUrl = await UnsplashImageService.fetchImageForPlace(name);

      places.add(
        PlaceModel(
          id: item['xid'] ?? '',
          name: name,
          category: item['kinds'] ?? 'Place',
          description: 'Description not available',
          imageUrl: imageUrl,
        ),
      );
    }

    return places;
  }
}
