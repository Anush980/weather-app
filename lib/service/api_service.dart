import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = "77e2c1971b58766b07b7ecfb476d146e";
  final String baseUrl = "https://api.openweathermap.org/data/2.5/weather";

  Future<Map<String, dynamic>> getWeather(String city) async {
    final url = Uri.parse("$baseUrl?q=$city&appid=$apiKey&units=metric");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load weather: ${response.body}");
    }
  }

  Future<List<dynamic>> getForecast(String city) async {
    final url = Uri.parse(
      "$baseUrl/forecast?q=$city&appid=$apiKey&units=metric",
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data["list"];
    } else {
      throw Exception("Failed to load Forecast: ${response.body}");
    }
  }
}
