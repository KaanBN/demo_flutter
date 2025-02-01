import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  final String name;
  final MainWeather main;
  final List<WeatherDescription> weather;

  WeatherModel({
    required this.name,
    required this.main,
    required this.weather,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class MainWeather {
  final double temp;

  MainWeather({
    required this.temp,
  });

  factory MainWeather.fromJson(Map<String, dynamic> json) => _$MainWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$MainWeatherToJson(this);
}

@JsonSerializable()
class WeatherDescription {
  final String description;
  final String icon;

  WeatherDescription({
    required this.description,
    required this.icon,
  });

  factory WeatherDescription.fromJson(Map<String, dynamic> json) => _$WeatherDescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherDescriptionToJson(this);
}
