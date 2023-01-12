import 'package:flutter/material.dart';

class SavedCitiesContainer extends StatelessWidget {
   SavedCitiesContainer({Key? key}) : super(key: key);

  late String?  city;

 // SavedCitiesContainer({required this.city});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 262.0,
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10.0),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: Center(child: Text('Charneca de Caparica', style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),))),
            Expanded(
              child: IconButton(
                padding: EdgeInsets.only(right: 13.0,),
                alignment: AlignmentDirectional.centerEnd,
                onPressed: (){


                },
                icon:const Icon(Icons.arrow_forward_ios_outlined),
                //replace with our own icon data.
              ),
            )

          ],

        ),
      ),
    ),);
  }
}
