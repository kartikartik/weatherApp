import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/blocs/weather_bloc.dart';
import 'package:weather_app/blocs/weather_event.dart';
import 'package:weather_app/blocs/weather_state.dart';
import 'package:weather_app/helper/helper.dart';
import 'package:weather_app/services/service_locator.dart';
import 'package:weather_app/widgets/forecast_widgets.dart';
import 'package:weather_app/widgets/temperature_icon.dart';
import 'package:weather_app/services/get_location.dart';

class ForeCastScreen extends StatefulWidget {
  const ForeCastScreen({super.key});

  @override
  ForeCastScreenState createState() => ForeCastScreenState();
}

class ForeCastScreenState extends State<ForeCastScreen> {
  WeatherBloc weatherBloc = getIt<WeatherBloc>();

  @override
  void initState() {
    super.initState();
    getForeCastData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getForeCastData() async {
    Position position = await determinePosition();
    weatherBloc.add(
      FetchWeatherByCoordinates(position.latitude, position.longitude, 7),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('7 Days Forecast')),
      body: SafeArea(
        child: StreamBuilder<WeatherState>(
          stream: weatherBloc.stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasData) {
              final currentWeather = snapshot.data!.weather;
              if (currentWeather != null) {
                return ListView.builder(
                  itemCount: currentWeather.hourly?.temperature2m?.length,
                  itemBuilder: (context, index) {
                    final temperature =
                        currentWeather.hourly?.temperature2m?[index];
                    final time = currentWeather.hourly?.time?[index];
                    final windSpeed = currentWeather.hourly?.windSpeed?[index];
                    final cloudCover =
                        currentWeather.hourly?.cloudCover?[index];
                    return Container(
                      width: 80,
                      margin: EdgeInsets.all(6),
                      padding: EdgeInsets.all(8),
                      color: Colors.grey[300],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                        children: [
                          Column(
                            children: [
                              Text(formatTime(time ?? "")),
                              TemperatureIcon(temperature: temperature ?? 0.0),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 80,
                                child: ForecastItem(
                                  image: 'assets/images/wind.svg',
                                  label: '${windSpeed}km/h',
                                ),
                              ),
                              SizedBox(
                                width: 80,
                                child: ForecastItem(
                                  image: 'assets/images/snow.svg',
                                  label: '$cloudCover%',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return SizedBox();
              }
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            return Text('No data available.');
          },
        ),
      ),
    );
  }
}
