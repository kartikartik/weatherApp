# Weather App Using BLoC with Clean Architecture
This is a Flutter built using the BLoC pattern and Clean Architecture. The app includes features such as current Weather, search location . It uses http for getting api data. GetIt is used for dependency injection.

# Note : This project created on windows machine so might get issue in Mac OS due to Platform reason


## Features

## Landing Screen
- current temperature
- Current rainfall
- Current UV index
- Current Current Pollen Count,
- Current Air quality
- If it is day or night.
- Search new location and get weather
## View 7 Day Forecast
- Temperature
- Wind speed
- Cloud coverage / visibility
- Rainfall likelihood 
- Light levels (for day or night cycle)



## Folder Structure
```
lib/
├── blocs/
│   ├── weather_bloc.dart
│   ├── weather_event.dart
│   ├── weather_state.dat
├── models/
│   ├── weather_model.dart
│   ├── air_quality_model.dart
├── repositories/
│   ├── weather_repository.dart
├── screens/
│   ├── weather_screen.dart
│   ├── fore_cast_screen.dart
├── widgets/
│   ├── forecast_widgets.dart
│   ├── temperature_icon.dart
├── services/
│   ├──service_locator.dart
│   └── get_location.dart
├── helper/
│   ├──helper.dartt
├── main.dart
```


## **For this Assignment below packages are use :**

Programming Language: Dart

● Architecture:  flutter_bloc: ^9.1.0

● Dependency Injection: get_it: ^8.0.3

● Networking:  http: ^1.3.0

● Asynchronous Data Handling: Bloc

● Show Svg image: flutter_svg

● find locations: geolocator

● for date/time conversion: intl


## Screenshots of the application 📷

![LightMode](https://github.com/kartikartik/weatherApp/blob/main/1.jpeg)
![LightMode](https://github.com/kartikartik/weatherApp/blob/main/2.jpeg)
![LightMode](https://github.com/kartikartik/weatherApp/blob/main/3.jpeg)
![LightMode](https://github.com/kartikartik/weatherApp/blob/main/4.jpeg)
![LightMode](https://github.com/kartikartik/weatherApp/blob/main/5.jpeg)

