class WeatherEvent {}

class FetchWeatherByCoordinates extends WeatherEvent {
  final double latitude;
  final double longitude;
final int forecastDays;
  FetchWeatherByCoordinates(this.latitude, this.longitude,this.forecastDays);
}

class FetchWeatherByCity extends WeatherEvent {
  final String city;

  FetchWeatherByCity(this.city);
}