import 'package:flutter/material.dart';
import '../features/home/home_screen.dart';
import '../features/places/place_list_screen.dart';

class AppRoutes {
  static const home = '/';
  static const places = '/places';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case places:
        final city = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => PlaceListScreen(city: city),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Route not found")),
          ),
        );
    }
  }
}
