import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/api_keys.dart';
import '../models/weather_model.dart';

class WeatherService {
  final String _baseUrl = "https://api.openweathermap.org/data/2.5";

  Future<WeatherModel> fetchWeather(String city) async {
    final url = Uri.parse("$_baseUrl/weather?q=$city&units=metric&appid=${ApiKeys.weatherApiKey}");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WeatherModel.fromJson(data);
    } else {
      throw Exception("Hava durumu verisi alınamadı: ${response.statusCode}");
    }
  }
}
