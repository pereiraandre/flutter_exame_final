import 'package:flutter/material.dart';
import 'package:flutter_exame_final/model/weather_model.dart';
import 'package:flutter_exame_final/services/weather.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';

class CityProvider extends ChangeNotifier {
  bool loading = false;

  final WeatherServices _weatherServices = WeatherServices.instance;

  String _name = "";

  String get getName => _name;

  WeatherModel? weather;

  bool isChecked = false;


  saveCity(String name) {
    _name = name;
    notifyListeners();
  }

  deleteCity() {
    _name = '';
    notifyListeners();
  }

  getPosition() async {
    loading = true;
    notifyListeners();
    try {
      List<Location> locations = await locationFromAddress(_name);
      if (locations.isNotEmpty) {
        String? lat = locations.first.latitude.toString();
        String? long = locations.first.longitude.toString();
        weather = await _weatherServices.getCoordinates(lat, long);
        isChecked = true;
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.green,
          gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3);
    }
    loading = false;
    notifyListeners();

  }


}
