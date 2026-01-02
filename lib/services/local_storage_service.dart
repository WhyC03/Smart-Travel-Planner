import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/itinerary_item.dart';

class LocalStorageService {
  static const _key = 'itinerary_items';

  static Future<void> save(List<ItineraryItem> items) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = items.map((e) => e.toJson()).toList();
    prefs.setString(_key, jsonEncode(jsonList));
  }

  static Future<List<ItineraryItem>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);

    if (data == null) return [];

    final List decoded = jsonDecode(data);
    return decoded.map((e) => ItineraryItem.fromJson(e)).toList();
  }
}
