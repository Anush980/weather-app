import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = "77e2c1971b58766b07b7ecfb476d146e";
  final String baseUrl = "https://api.openweathermap.org/data/2.5";

  // Get weather by city
  Future<Map<String, dynamic>> getWeather(String city) async {
    final url = Uri.parse("$baseUrl/weather?q=$city&appid=$apiKey&units=metric");
    final response = await http.get(url);
    if (response.statusCode == 200) return json.decode(response.body);
    throw Exception("City '$city' not found");
  }

  Future<List<dynamic>> getForecast(String city) async {
    final url = Uri.parse("$baseUrl/forecast?q=$city&appid=$apiKey&units=metric");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['list'];
    }
    throw Exception("City '$city' not found");
  }

  // Get weather by latitude & longitude
  Future<Map<String, dynamic>> getWeatherByLocation(double lat, double lon) async {
    final url = Uri.parse("$baseUrl/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric");
    final response = await http.get(url);
    if (response.statusCode == 200) return json.decode(response.body);
    throw Exception("Location weather not found");
  }

  Future<List<dynamic>> getForecastByLocation(double lat, double lon) async {
    final url = Uri.parse("$baseUrl/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['list'];
    }
    throw Exception("Location forecast not found");
  }
}
