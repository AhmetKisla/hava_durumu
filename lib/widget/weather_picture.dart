import 'package:flutter/material.dart';

class WeatherPicture extends StatelessWidget{
  final havaDurumuResim;
  const WeatherPicture({Key key, this.havaDurumuResim}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network("https://www.metaweather.com/static/img/weather/png/"+havaDurumuResim+".png");
  }



}