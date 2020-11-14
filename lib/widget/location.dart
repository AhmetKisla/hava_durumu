import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget{
  String secilenSehir;
  LocationWidget({this.secilenSehir});
  @override
  Widget build(BuildContext context) {
   return Text(secilenSehir,style: TextStyle(fontSize: 32),);
  }

}