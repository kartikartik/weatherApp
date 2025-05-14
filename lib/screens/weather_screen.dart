import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/blocs/weather_bloc.dart';
import 'package:weather_app/blocs/weather_event.dart';
import 'package:weather_app/blocs/weather_state.dart';
import 'package:weather_app/helper/helper.dart';
import 'package:weather_app/screens/fore_cast_screen.dart';
import 'package:weather_app/services/service_locator.dart';
import 'package:weather_app/widgets/forecast_widgets.dart';
import 'package:weather_app/widgets/temperature_icon.dart';
import 'package:weather_app/services/get_location.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  WeatherScreenState createState() => WeatherScreenState();
}

class WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  WeatherBloc weatherBloc = getIt<WeatherBloc>();

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  getCurrentLocation() async {
    Position position = await determinePosition();
    
    weatherBloc.add(
      FetchWeatherByCoordinates(position.latitude, position.longitude, 1),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();    
  }

  handleFetchWeatherByCity() {
    final city = _controller.text.trim();
    if (city.isNotEmpty) {
      _focusNode.unfocus();
      weatherBloc.add(FetchWeatherByCity(city));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Weather App')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        hintText: 'Enter City Here',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  IconButton(
                    icon: Icon(Icons.send, size: 34),
                    onPressed: () {
                      handleFetchWeatherByCity();
                    },
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            StreamBuilder<WeatherState>(
              stream: weatherBloc.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                if (snapshot.hasData) {
                  final currentWeather = snapshot.data!.weather;
                  final currentAirQuality = snapshot.data!.airQuality;
                  if (currentWeather != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        SizedBox(height: 20),
                        Text(
                          '${currentWeather.current?.temperature2m}°C',
                          style: TextStyle(
                            fontSize: 44.0,
                            height: 0.4,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                          _controller.text,
                          style: TextStyle(
                            fontSize: 22.0,

                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(
                          height: 110,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                currentWeather.hourly?.temperature2m?.length,
                            itemBuilder: (context, index) {
                              final temperature =
                                  currentWeather.hourly?.temperature2m?[index];
                              final time = currentWeather.hourly?.time?[index];
                              return Container(
                                width: 80,
                                margin: EdgeInsets.all(4),
                                color: Colors.grey[300],
                                child: Column(
                                  spacing: 8,
                                  children: [
                                    Text(formatTime(time ?? "")),
                                    TemperatureIcon(
                                      temperature: temperature ?? 0.0,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 40),
                        Container(
                          color: Colors.grey[300],
                          margin: EdgeInsets.all(10),
                          height: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ForecastItem(
                                image: 'assets/images/sun.svg',
                                label:
                                    'UV Index \n   ${currentWeather.daily?.uvIndexMax![0]}°',
                              ),

                              ForecastItem(
                                image: 'assets/images/wind.svg',
                                label:
                                    'Pollen \n${currentAirQuality?.current?.grassPollen}m³',
                              ),
                              ForecastItem(
                                image: 'assets/images/humidity.svg',
                                label:
                                    'Air Quality \n${currentAirQuality?.current?.pm25}μg/m³',
                              ),
                              ForecastItem(
                                image: 'assets/images/sun.svg',
                                label:
                                    currentWeather.current?.isDay == 1
                                        ? 'Day'
                                        : 'Night',
                              ),
                            ],
                          ),
                        ),
                      ],
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
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Set the background color
                foregroundColor: Colors.white, // Set the text color
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => BlocProvider.value(
                          value: getIt<WeatherBloc>(),
                          child: ForeCastScreen(),
                        ),
                  ),
                );
              },
              child: Text('View 7-Day Forecast'),
            ),
          ],
        ),
      ),
    );
  }
}
