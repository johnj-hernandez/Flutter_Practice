import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child:  Column(
        children: <Widget>[
          Icon(
              Icons.settings,
              size: 170.0,
              color: Colors.grey
          ),
          Text("Cuarto tab")
        ],
      ),

    );
  }
}