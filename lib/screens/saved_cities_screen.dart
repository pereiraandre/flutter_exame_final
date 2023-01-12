import 'package:flutter/material.dart';
import 'package:flutter_exame_final/components/saved_cities_container.dart';
import 'package:provider/provider.dart';
import '../provider/city_provider.dart';

class MySavedCities extends StatelessWidget {
  const MySavedCities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CityProvider>(
        builder: (BuildContext context, value, Widget? child) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'My Saved Cities',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 27.0),
          ),
          leading: BackButton(
            onPressed: () {
             /* value.deleteCity();
              value.weather = null;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));*/
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 22, left: 64.0, right: 64.0),
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index){
                        return SavedCitiesContainer();
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                            height: 24.0,
                          ),
                      itemCount: 5),
                ))
          ],
        ),
      );
    });
  }
}
