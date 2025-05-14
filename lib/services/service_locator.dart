import 'package:get_it/get_it.dart';
import 'package:weather_app/blocs/weather_bloc.dart';
import 'package:weather_app/repository/weather_repository.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<WeatherRepository>(WeatherRepository());
  getIt.registerFactory<WeatherBloc>(() => WeatherBloc(getIt<WeatherRepository>()));
}