import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static const _apiKey = 'PASTE_OPEN_WEATHER_MAP_API_KEY_HERE';

  Future<Map<String, String>> fetchWeather(String city) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$_apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return {
        'temp': '${data['main']['temp'].round()}°C',
        'description': data['weather'][0]['description'],
      };
    } else {
      throw Exception('Failed to fetch weather');
    }
  }
}
