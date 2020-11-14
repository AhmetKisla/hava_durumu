part of 'weather_bloc.dart';
abstract class WeatherEvent extends Equatable {
   List<Object> get props=>[];
}

class FetchWeatherEvent extends WeatherEvent{
  final _city;
  FetchWeatherEvent(this._city);
  List<Object> get props=>[_city];
}
