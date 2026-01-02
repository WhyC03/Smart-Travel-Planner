import 'dart:convert';
import 'package:http/http.dart' as http;

class UnsplashImageService {
  // 🔑 PASTE YOUR UNSPLASH ACCESS KEY HERE
  static const String _accessKey = 'PASTE_UNSPLASH_ACCESS_KEY_HERE';

  static const String _baseUrl = 'https://api.unsplash.com/search/photos';

  
  static Future<String> fetchImageForPlace(String placeName) async {
    final url =
        '$_baseUrl?query=$placeName&per_page=1&client_id=$_accessKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return _fallbackImage();
    }

    final data = jsonDecode(response.body);

    if (data['results'] == null || data['results'].isEmpty) {
      return _fallbackImage();
    }

    return data['results'][0]['urls']['regular'];
  }

  static String _fallbackImage() {
    return 'https://via.placeholder.com/600x400.png?text=No+Image';
  }
}
