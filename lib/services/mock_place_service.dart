import '../models/place_model.dart';

class MockPlaceService {
  List<PlaceModel> getPlacesForCity(String city) {
    return [
      PlaceModel(
        id: '1',
        name: 'India Gate',
        category: 'Monument',
        description:
            'India Gate is a war memorial located in the heart of New Delhi.',
        imageUrl:
            'https://images.unsplash.com/photo-1587474260584-136574528ed5',
      ),
      PlaceModel(
        id: '2',
        name: 'Red Fort',
        category: 'Historical Site',
        description:
            'The Red Fort is a historic fort in the city of Delhi.',
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1661919589683-f11880119fb7?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8UmVkJTIwZm9ydHxlbnwwfHwwfHx8MA%3D%3D',
      ),
    ];
  }
}
