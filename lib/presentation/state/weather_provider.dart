import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/weather_service.dart';
import '../../data/models/weather_model.dart';

final weatherServiceProvider = Provider<WeatherService>((ref) => WeatherService());

final weatherProvider = FutureProvider.family<WeatherModel, String>((ref, city) async {
  final weatherService = ref.read(weatherServiceProvider);
  return weatherService.fetchWeather(city);
});