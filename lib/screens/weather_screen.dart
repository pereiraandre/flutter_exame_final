import 'package:flutter/material.dart';
import 'package:flutter_exame_final/provider/city_provider.dart';
import 'package:provider/provider.dart';
import '../components/save_button.dart';
import '../components/weather_container.dart';
import '../constants.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CityProvider>(
      builder: (BuildContext context, value, Widget? child) {
        var main = value.weather?.main;
        var darkColor =
            main == 'Rain' || main == 'Clouds' ? Colors.black : Colors.white;
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: main == 'Rain' || main == 'Clouds'
                    ? const AssetImage('images/bad_weather.png')
                    : const AssetImage('images/good_weather.png'),
                fit: BoxFit.cover),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Padding(
                padding: const EdgeInsets.only(top: 54.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButton(
                      onPressed: () {
                        value.deleteCity();
                        value.weather = null;
                        Navigator.pop(context);
                      },
                      color: darkColor,
                    ),
                    Text(
                      value.weather?.name == null
                          ? 'No data'
                          : '${value.weather?.name}',
                      style: kTextWeatherScreen.copyWith(color: darkColor),
                    ),
                    SaveButton(darkColor),
                  ],
                ),
              ),
            ),
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 68.0, left: 20.0),
                    child: Text(
                      value.weather?.main == null
                          ? 'No data'
                          : '${value.weather?.main}',
                      style: kTextWeatherScreen,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      value.weather?.temperature?.toInt() == null
                          ? 'No data'
                          : '${value.weather?.temperature?.toInt()}º',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 70.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        WeatherContainer(
                          titleText: 'Humidity',
                          value: value.weather?.humidity?.toInt() == null
                              ? 'No data'
                              : '${value.weather?.humidity?.toInt()}%',
                        ),
                        WeatherContainer(
                          titleText: 'Sea Level',
                          value: value.weather?.seaLevel?.toInt() == null
                              ? 'No data'
                              : '${value.weather?.seaLevel?.toInt()}m',
                        ),
                        WeatherContainer(
                          titleText: 'Wind',
                          value: value.weather?.wind?.toInt() == null
                              ? 'No data'
                              : '${value.weather?.wind?.toInt()}km/h',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    margin: const EdgeInsets.only(
                      right: 25.0,
                      left: 25.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 19.0,
                        bottom: 19.0,
                        right: 50.0,
                        left: 50.0,
                      ),
                      child: Text(
                        main == 'Rain' || main == 'Clouds'
                            ? 'Humidity looks ${value.weather?.humidityDescription()}, sea level looks '
                                '${value.weather?.seaLevelDescription() ?? 'Like we Can\'t get the value from it'} '
                                'and wind looks ${value.weather?.windLevelDescription()}, '
                                'Let\'s get the fish from the supermarket instead'
                            : 'Humidity looks ${value.weather?.humidityDescription()}, sea level looks '
                                '${value.weather?.seaLevelDescription() ?? 'Like we Can\'t get the value from it'} '
                                'and wind looks ${value.weather?.windLevelDescription()}, '
                                'Let\'s get that fishing starting, and catch some douradas to your friends',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
