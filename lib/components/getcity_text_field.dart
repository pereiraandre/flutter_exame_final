import 'package:flutter/material.dart';
import 'package:flutter_exame_final/provider/city_provider.dart';
import 'package:provider/provider.dart';

class TopTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 64.0, right: 64.0),
      child: TextField(
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black),
        onChanged: (value) {
          Provider.of<CityProvider>(context, listen: false).saveCity(value);
        },
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Insert city name',
          hintStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 18.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
      ),
    );
  }
}
