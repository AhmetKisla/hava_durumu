part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  List<Object> get props=>[];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState{}
class WeatherLoadedState extends WeatherState{
  final _weather;
  WeatherLoadedState(this._weather);
  Weather get getWeather=>_weather;
  List<Object> get props=>[_weather];
}
class WeatherErrorState extends WeatherState{}
