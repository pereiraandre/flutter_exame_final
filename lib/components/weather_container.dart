import 'package:flutter/material.dart';
import '../constants.dart';

class WeatherContainer extends StatelessWidget {
  WeatherContainer({super.key, required this.titleText, required this.value});

  late String titleText;
  late String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 120.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              titleText,
              overflow: TextOverflow.ellipsis,
              style: kTextWeatherScreen,
            ),
            Text(
              value,
              style: kTextWeatherScreen.copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
