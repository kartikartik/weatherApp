import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/air_quality_model.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherRepository {
    Future<Weather> fetchWeather(
    double latitude,
    double longitude,
    int days,
  ) async {
    String url =
      'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&daily=uv_index_max,rain_sum&hourly=temperature_2m,wind_speed_10m,cloud_cover&current=temperature_2m,rain,wind_speed_10m,relative_humidity_2m,is_day&forecast_days=$days';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

 Future<AirQuality> fetchAirQuality(
    double latitude,
    double longitude,
    
  ) async {
    String url =
      'https://air-quality-api.open-meteo.com/v1/air-quality?latitude=$latitude&longitude=$longitude&hourly=birch_pollen&current=grass_pollen,pm2_5';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return AirQuality.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
  

  Future<Coordinates?> getCoordinatesFromCity(
    String city,
    String apiKey,
  ) async {
    final response = await http.get(
      Uri.parse(
        'https://api.opencagedata.com/geocode/v1/json?q=$city&key=$apiKey',
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['results'].isNotEmpty) {
        final latitude = data['results'][0]['geometry']['lat'];
        final longitude = data['results'][0]['geometry']['lng'];
        return Coordinates(latitude, longitude);
      }
    }
    return null; // Return null if no coordinates found or an error occurred
  }
}

class Coordinates {
  final double latitude;
  final double longitude;

  Coordinates(this.latitude, this.longitude);
}
