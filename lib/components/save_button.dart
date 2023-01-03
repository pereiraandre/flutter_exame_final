import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {

  Color color;

  SaveButton(this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 21.0),
      child: IconButton(onPressed: () {}, icon: Icon(Icons.save),color: color,),
    );
  }
}
