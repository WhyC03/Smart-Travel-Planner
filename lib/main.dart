import 'package:flutter/material.dart';
import 'package:smart_travel_planner/core/constants/app_theme.dart';
import 'package:smart_travel_planner/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Travel Planner',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.generateRoute,
      // home: PlaceListScreen(city: "Delhi"),
    );
  }
}
