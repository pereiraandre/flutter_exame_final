import 'package:flutter/material.dart';
import 'package:flutter_exame_final/model/weather_model.dart';
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



        final WeatherModel weather = value.weather!;

        var darkColor = weather.isBadWeather ? Colors.black : Colors.white;

        List<WeatherContainer> listWeatherValues = [
          WeatherContainer(
            titleText: 'Humidity',
            value: weather.humidity == null
                ? 'No data'
                : '${weather.humidity?.toInt()}%',
          ),
          WeatherContainer(
              titleText: 'Sea Level',
              value: weather.seaLevel == null
                  ? 'No data'
                  : '${weather.seaLevel?.toInt()}m'),
          WeatherContainer(
              titleText: 'Wind',
              value: weather.wind == null
                  ? 'No data'
                  : '${weather.wind?.toInt()}km/h')
        ];
        return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: weather.isBadWeather
                      ? const AssetImage('images/bad_weather.png')
                      : const AssetImage('images/good_weather.png'),
                  fit: BoxFit.cover),
            ),
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: BackButton(
                    onPressed: () {
                      Navigator.pop(context);
                      value.deleteCity();
                      value.isChecked = false;

                    },
                    color: darkColor,
                  ),
                  title: Text(
                    weather.name == null
                        ? 'No data'
                        : '${weather.name}',
                    style: kTextWeatherScreen.copyWith(color: darkColor),
                  ),
                  actions: [SaveButton(darkColor)],
                ),
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 68.0, right: 20),
                        child: Text(
                          weather.main == null
                              ? 'No data'
                              : '${weather.main}',
                          style: kTextWeatherScreen,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          weather.temperature == null
                              ? 'No data'
                              : '${weather.temperature?.toInt()}º',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 70.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0,
                            right: 15.0,
                            top: 116.0,
                            bottom: 116.0),

                        child: SizedBox(
                          height: 144.0,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: listWeatherValues.length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                              width: 15.0,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return WeatherContainer(
                                  titleText: listWeatherValues[index].titleText,
                                  value: listWeatherValues[index].value);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 130.0,
                          right: 25.0,
                          left: 25.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              weather.badWeatherDescription() ??
                                  'No description available',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
