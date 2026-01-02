class ItineraryItem {
  final String name;
  final String category;

  ItineraryItem({required this.name, required this.category});

  Map<String, dynamic> toJson() => {'name': name, 'category': category};

  factory ItineraryItem.fromJson(Map<String, dynamic> json) {
    return ItineraryItem(name: json['name'], category: json['category']);
  }
}
