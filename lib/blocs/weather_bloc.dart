import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_event.dart';
import 'package:weather_app/blocs/weather_state.dart';
import 'package:weather_app/repository/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final String apiKey =
      'f39896daefad4c108aa3187cfa730f42'; // Replace with your OpenCage API key
  final WeatherRepository repository;
  
  WeatherBloc(this.repository) : super(WeatherState()) {
    on<FetchWeatherByCoordinates>((event, emit) async {
      emit(WeatherState(isLoading: true));
      final weatherData = await repository.fetchWeather(
        event.latitude,
        event.longitude,
        event.forecastDays,
      );
      final airQualityData = await repository.fetchAirQuality(
        event.latitude,
        event.longitude
       
      );
      emit(WeatherState(weather: weatherData,airQuality: airQualityData));
    });

    on<FetchWeatherByCity>((event, emit) async {
      emit(WeatherState(isLoading: true));
      final coordinates = await repository.getCoordinatesFromCity(
        event.city,
        apiKey,
      );
      if (coordinates != null) {
        emit(WeatherState(isLoading: true));
        add(
          FetchWeatherByCoordinates(
            coordinates.latitude,
            coordinates.longitude,
            1
          ),
        );
      } else {
        emit(WeatherState());
      }
    });
  }
}
