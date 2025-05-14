import 'package:weather_app/model/air_quality_model.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherState {
  final Weather? weather;
  final AirQuality? airQuality;
  final bool isLoading;

  WeatherState({this.weather, this.airQuality,this.isLoading = false});
}
