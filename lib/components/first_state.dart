import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'primary_button.dart';
import 'getcity_text_field.dart';
import 'package:provider/provider.dart';
import 'package:flutter_exame_final/provider/city_provider.dart';

class FirstState extends StatelessWidget {
  const FirstState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(),
            child: Text(
              'Let\'s see your city first',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 27.0,
          ),
          TopTextField(),
          const Spacer(),
          //MyCitiesButton(),
          PrimaryButton(
              text: 'LET\'S SEE',
              onPressed: () {
                Provider.of<CityProvider>(context, listen: false)
                        .getName
                        .isEmpty
                    ? Fluttertoast.showToast(
                        msg: 'You forgot to put the city name',
                        backgroundColor: Colors.blueAccent,
                        gravity: ToastGravity.CENTER)
                    : Provider.of<CityProvider>(context, listen: false)
                        .getPosition();
              }),
          const SizedBox(
            height: 47.0,
          ),
        ],
      ),
    );
  }
}
