import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_hava_durumu/data/weather_repository.dart';
import 'package:flutter_hava_durumu/locator.dart';
import 'package:flutter_hava_durumu/models/weather.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository=locator<WeatherRepository>();
  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if(event is FetchWeatherEvent){
      yield WeatherLoadingState();
      try{
         final Weather getirilenWeather= await weatherRepository.getWeather(event._city);
         yield WeatherLoadedState(getirilenWeather);
      }catch(_){
        yield WeatherErrorState();
      }
    }
  }

}
