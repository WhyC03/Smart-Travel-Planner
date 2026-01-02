// ignore_for_file: control_flow_in_finally

import 'package:flutter/material.dart';
import 'package:smart_travel_planner/core/constants/app_sizes.dart';
import 'package:smart_travel_planner/features/itinerary/itinerary_screen.dart';
import 'package:smart_travel_planner/services/itinearary_service.dart';
import 'package:smart_travel_planner/services/local_storage_service.dart';
import 'package:smart_travel_planner/services/weather_service.dart';
import 'package:smart_travel_planner/widgets/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  String? cityName;
  String? temperature;
  String? weatherDescription;

  final WeatherService _weatherService = WeatherService();

  @override
  void initState() {
    super.initState();
    _loadItinerary();
  }

  Future<void> _loadItinerary() async {
    final saved = await LocalStorageService.load();
    ItineraryService.clear();
    ItineraryService.items.addAll(saved);
  }

  Future<void> _searchCity(String city) async {
    if (city.trim().isEmpty) return;

    setState(() {
      isLoading = true;
    });

    try {
      final weather = await _weatherService.fetchWeather(city);

      if (!mounted) return;

      setState(() {
        cityName = city;
        temperature = weather['temp'];
        weatherDescription = weather['description'];
      });
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Unable to fetch weather. Please try again."),
        ),
      );
    } finally {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppSizes.paddingMD),
        child: Column(
          children: [
            SearchBarWidget(onSearch: _searchCity),

            SizedBox(height: AppSizes.paddingLG),
            if (isLoading)
              Center(child: CircularProgressIndicator())
            else if (cityName != null)
              Column(
                children: [
                  _weatherCard(cityName, weatherDescription, temperature),
                  const SizedBox(height: AppSizes.paddingMD),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/places',
                        arguments: cityName,
                      );
                    },
                    child: const Text("Explore Places"),
                  ),
                ],
              )
            else
              _emptyState(),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Smart Travel Planner"),
        actions: [
          IconButton(
            icon: const Icon(Icons.list_alt),
            tooltip: "View Itinerary",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ItineraryScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _weatherCard(String? cityName, String? weather, String? temperature) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingMD),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cityName!, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(weather!, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            Text(temperature!, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }

  Widget _emptyState() {
    return Center(
      child: Text(
        "Search for a city to start planning your trip",
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
