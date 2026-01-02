// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:smart_travel_planner/models/itinerary_item.dart';
import 'package:smart_travel_planner/services/itinearary_service.dart';
import 'package:smart_travel_planner/services/local_storage_service.dart';
import '../../core/constants/app_sizes.dart';
import '../../models/place_model.dart';

class PlaceDetailScreen extends StatelessWidget {
  final PlaceModel place;

  const PlaceDetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.paddingMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.radiusMD),
              child: Image.network(
                place.imageUrl,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 220,
                    color: Colors.grey.shade200,
                    child: const Center(
                      child: Icon(Icons.image_not_supported, size: 48),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: AppSizes.paddingLG),

            Text(place.name, style: Theme.of(context).textTheme.titleLarge),

            const SizedBox(height: 8),

            Text(place.category, style: Theme.of(context).textTheme.bodyMedium),

            const SizedBox(height: AppSizes.paddingLG),

            Text(
              place.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: AppSizes.paddingLG),

            ElevatedButton(
              onPressed: () async {
                ItineraryService.add(
                  ItineraryItem(name: place.name, category: place.category),
                );

                await LocalStorageService.save(ItineraryService.items);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Added to itinerary")),
                );
              },
              child: const Text("Add to Itinerary"),
            ),
          ],
        ),
      ),
    );
  }
}
