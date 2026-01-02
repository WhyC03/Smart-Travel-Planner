import 'package:flutter/material.dart';
import 'package:smart_travel_planner/services/itinearary_service.dart';
import '../../core/constants/app_sizes.dart';

class ItineraryScreen extends StatefulWidget {
  const ItineraryScreen({super.key});

  @override
  State<ItineraryScreen> createState() => _ItineraryScreenState();
}

class _ItineraryScreenState extends State<ItineraryScreen> {
  @override
  Widget build(BuildContext context) {
    final items = ItineraryService.items;

    return Scaffold(
      appBar: AppBar(title: const Text("Your Itinerary")),
      body: items.isEmpty
          ? const Center(child: Text("No places added yet"))
          : ListView.builder(
              padding: const EdgeInsets.all(AppSizes.paddingMD),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return Card(
                  child: ListTile(
                    title: Text(item.name),
                    subtitle: Text(item.category),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          ItineraryService.remove(item);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
