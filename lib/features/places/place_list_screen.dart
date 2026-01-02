import 'package:flutter/material.dart';
import 'package:smart_travel_planner/services/opentripmap_service.dart';
import '../../core/constants/app_sizes.dart';
import '../../models/place_model.dart';
import '../../services/mock_place_service.dart';
import '../itinerary/itinerary_screen.dart';
import '../places/place_detail_screen.dart';
import '../../widgets/place_card.dart';

class PlaceListScreen extends StatefulWidget {
  final String city;

  const PlaceListScreen({super.key, required this.city});

  @override
  State<PlaceListScreen> createState() => _PlaceListScreenState();
}

class _PlaceListScreenState extends State<PlaceListScreen> {
  // Switch Here Later
  final MockPlaceService _mockService = MockPlaceService();
  // final OpenTripMapPlaceService _apiService = OpenTripMapPlaceService();

  List<PlaceModel> places = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    places = _mockService.getPlacesForCity(widget.city);

    // _loadPlacesFromApi();
  }

  // When you switch it, just uncomment the below code

  // Future<void> _loadPlacesFromApi() async {
  //   setState(() => isLoading = true);

  //   try {
  //     final result = await _apiService.fetchPlaces(lat: 28.6139, lon: 77.2090);

  //     setState(() => places = result);
  //   } catch (_) {
  //     // keep mock data as fallback
  //   } finally {
  //     setState(() => isLoading = false);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places in ${widget.city}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list_alt),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ItineraryScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingMD),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: places.length,
                itemBuilder: (context, index) {
                  return PlaceCard(
                    place: places[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              PlaceDetailScreen(place: places[index]),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
