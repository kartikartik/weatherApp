import 'package:flutter/material.dart';

class TemperatureIcon extends StatelessWidget {
  final double temperature; // Temperature in Celsius

  const TemperatureIcon({super.key, required this.temperature});

  @override
  Widget build(BuildContext context) {
    IconData iconData;

    // Determine the icon based on the temperature
    if (temperature >= 30) {
      iconData = Icons.wb_sunny; // Hot weather icon
    } else if (temperature >= 20) {
      iconData = Icons.wb_sunny; // Warm weather icon
    } else if (temperature >= 10) {
      iconData = Icons.cloud; // Mild weather icon
    } else {
      iconData = Icons.ac_unit; // Cold weather icon
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 34.0,
          color: Colors.blue,
        ),
        SizedBox(width: 8.0),
        Text(
          '${temperature.toStringAsFixed(1)}°C',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
