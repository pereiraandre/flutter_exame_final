import 'package:flutter_exame_final/model/weather_model.dart';
import 'network.dart';

const apiKey = '69bdcf592dddb1852a6b57abf8b2737d';
const openWeatherMapURL = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherServices {
  WeatherServices._privateConstructor();

  static final WeatherServices _instance =
      WeatherServices._privateConstructor();

  static WeatherServices get instance => _instance;

  Future<WeatherModel> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    var weatherMap = await networkHelper.getData();
    WeatherModel weatherModel = WeatherModel.fromJson(weatherMap);
    return weatherModel;
  }

  Future<WeatherModel?> getCoordinates(String lat, String long) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=$lat&lon=$long&appid=$apiKey&units=metric');
    var weatherMap = await networkHelper.getData();
    if (weatherMap == null) {
      return null;
    }
    WeatherModel weatherModel = WeatherModel.fromJson(weatherMap);
    return weatherModel;
  }
}
