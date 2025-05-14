import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForecastItem extends StatelessWidget {
  final String image; // Icon data
  final String label; // Text label

  const ForecastItem({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          SvgPicture.asset(
           image, // Path to your first SVG file
            width: 40.0,
            height: 40.0,
          ),

          Text(label),
        ],
      ),
    );
  }
}
