// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      name: json['name'] as String,
      main: MainWeather.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'main': instance.main,
      'weather': instance.weather,
    };

MainWeather _$MainWeatherFromJson(Map<String, dynamic> json) => MainWeather(
      temp: (json['temp'] as num).toDouble(),
    );

Map<String, dynamic> _$MainWeatherToJson(MainWeather instance) =>
    <String, dynamic>{
      'temp': instance.temp,
    };

WeatherDescription _$WeatherDescriptionFromJson(Map<String, dynamic> json) =>
    WeatherDescription(
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$WeatherDescriptionToJson(WeatherDescription instance) =>
    <String, dynamic>{
      'description': instance.description,
      'icon': instance.icon,
    };
