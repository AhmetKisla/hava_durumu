import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hava_durumu/blocs/weather/weather_bloc.dart';
import 'package:flutter_hava_durumu/locator.dart';
import 'package:flutter_hava_durumu/widget/weather_app.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:BlocProvider(
        create: (context)=>WeatherBloc(),
        child: WeatherApp(),
      )
    );
  }
}


