import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hava_durumu/blocs/weather/weather_bloc.dart';
import 'package:flutter_hava_durumu/widget/weather_picture.dart';
import 'choose_city.dart';
import 'last_update.dart';
import 'location.dart';
import 'max_min_temperature.dart';

class WeatherApp extends StatelessWidget {
  String secilenSehir="Ankara";
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: ()async{
              secilenSehir = await Navigator.push(context, MaterialPageRoute(builder: (context)=>ChooseCity()));
              debugPrint(secilenSehir);
             if(secilenSehir!=null){
                 weatherBloc.add(FetchWeatherEvent(secilenSehir));
              }
            },
          )
        ],
      ),
      body:BlocBuilder<WeatherBloc,WeatherState>(
          builder: (context, state){
            if(state is WeatherInitial){
              return Center(child: Text("Şehir seçiniz"),);
            }
            if(state is WeatherLoadingState){
              return Center(child:CircularProgressIndicator());
            }
            if(state is WeatherLoadedState){
              final  getirilenWeather = state.getWeather;
              debugPrint(getirilenWeather.title);
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: LocationWidget(secilenSehir:getirilenWeather.title,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: LastUpdate(lastUpdate: getirilenWeather.time.toLocal(),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: WeatherPicture(havaDurumuResim: getirilenWeather.consolidatedWeather[0].weatherStateAbbr,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: MaxMinTemperature(maxTemp: getirilenWeather.consolidatedWeather[0].maxTemp.floor(),minTemp: getirilenWeather.consolidatedWeather[0].minTemp.floor(),),
                    ),
                  )
                ],
              );
            }
            if(state is WeatherErrorState){
              return Center(child: Text("Hata Oluştu"),);
            }
            return null;
          },)
    );
  }
}
