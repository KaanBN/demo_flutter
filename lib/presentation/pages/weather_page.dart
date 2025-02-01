import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/weather_provider.dart';

class WeatherPage extends ConsumerWidget {
  final String city;

  const WeatherPage({super.key, required this.city});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsyncValue = ref.watch(weatherProvider(city));

    return Scaffold(
      appBar: AppBar(title: Text("Hava Durumu - $city")),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 5,
                child: TextField(
                  onChanged: (value) {

                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    print("asd");
                  },
                  icon: Icon(
                      Icons.refresh
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: weatherAsyncValue.when(
              data: (weather) {
                final description = weather.weather.isNotEmpty ? weather.weather[0].description : "N/A";
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Şehir: ${weather.name}",
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Sıcaklık: ${weather.main.temp} °C",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Durum: $description",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      if (weather.weather.isNotEmpty)
                        Image.network(
                          "http://openweathermap.org/img/wn/${weather.weather[0].icon}@2x.png",
                          fit: BoxFit.cover,
                        ),
                    ],
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(child: Text("Hata oluştu: $error")),
            ),
          )
        ],
      ),
    );
  }
}