import '../models/itinerary_item.dart';

class ItineraryService {
  static final List<ItineraryItem> _items = [];

  static List<ItineraryItem> get items => _items;

  static void add(ItineraryItem item) {
    if (!_items.any((e) => e.name == item.name)) {
      _items.add(item);
    }
  }

  static void remove(ItineraryItem item) {
    _items.removeWhere((e) => e.name == item.name);
  }

  static void clear() {
    _items.clear();
  }
}
