import 'package:flutter/material.dart';
import 'package:flutter_exame_final/provider/city_provider.dart';
import 'package:flutter_exame_final/screens/home_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CityProvider(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}


