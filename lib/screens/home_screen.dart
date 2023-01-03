import 'package:flutter/material.dart';
import 'package:flutter_exame_final/components/first_state.dart';
import 'package:flutter_exame_final/components/loading_state.dart';
import 'package:flutter_exame_final/provider/city_provider.dart';
import 'package:flutter_exame_final/screens/weather_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/home_page.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 52.0),
                child: Text(
                  'Should i go fishing?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 14.0,
              ),
              Consumer<CityProvider>(
                builder: (context, city, child) {
                  if (city.loading) {
                    return const LoadingState();
                  }
                  if (city.weather != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WeatherScreen())));
                  }
                  return FirstState();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
