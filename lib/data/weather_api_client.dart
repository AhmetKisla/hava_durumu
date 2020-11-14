import 'dart:convert';

import 'package:flutter_hava_durumu/models/weather.dart';
import "package:http/http.dart" as http;

class WeatherApiClient {
  final http.Client httpClient = http.Client();

  Future<int> getLocationID(String sehirAdi) async {
    final sehirURL = "https://www.metaweather.com/api/location/search/?query=" + sehirAdi;
    final gelenCevap = await httpClient.get(sehirURL);

    if (gelenCevap.statusCode != 200) {
      throw Exception("Veri Getirilemedi");
    }

    final gelenCevapJSON = (jsonDecode(gelenCevap.body)) ;
    return gelenCevapJSON[0]["woeid"];
  }

  Future<Weather> getWeather(int sehirID) async {
    final havaDurumuURL = "https://www.metaweather.com/api/location/"+sehirID.toString();
    final havaDurumuGelenCevap = await httpClient.get(havaDurumuURL);

    if (havaDurumuGelenCevap.statusCode != 200) {
      throw Exception("Hava durumu Getirilemedi");
    }

    final havaDurumucevapJSON = (jsonDecode(havaDurumuGelenCevap.body));
    return Weather.fromJson(havaDurumucevapJSON);
  }
}
