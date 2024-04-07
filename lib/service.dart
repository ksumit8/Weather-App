import 'dart:convert';

import 'package:http/http.dart' as http;

import 'apiHelper.dart';

class WeatherApiClient{
  Future<Weather>getCurrentWeather(String? cityName)async {
    var endpoint =Uri.parse("http://api.weatherapi.com/v1/current.json?key=fa24fd72b69c42b8aab30802240504 &q=$cityName&aqi=no");
    var response=await http.get(endpoint);
    var body=jsonDecode(response.body);
    print(Weather.fromjson(body).text);
    return Weather.fromjson(body);

  }
}