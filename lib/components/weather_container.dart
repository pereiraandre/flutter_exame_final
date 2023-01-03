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
      margin: const EdgeInsets.only(
          top: 151.0, bottom: 116.0, right: 14.0, left: 14.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 12.0,
              left: 12.0,
            ),
            child: Text(
              titleText,
              style: kTextWeatherScreen,
            ),
          ),
          Text(
            value,
            style: kTextWeatherScreen.copyWith(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
