import 'package:flutter/material.dart';

class MaxMinTemperature extends StatelessWidget{
  final maxTemp,minTemp;
  const MaxMinTemperature({Key key, this.maxTemp, this.minTemp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Maxsimum Sıcaklık "+maxTemp.toString()+"°C"),
        Text("Minumum Sıcaklık "+minTemp.toString()+"°C"),
      ],
    );
  }

}