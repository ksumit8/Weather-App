import 'package:flutter/material.dart';

class Weather{
  String? text;
  String? imageUrl;
  double? temp_c;
  double? wind_kph;
  String? wind_dir;
  double? pressure_mb;
  double? wind_mph;
  double? pressure_in;

  Weather({this.text,this.imageUrl,this.temp_c,this.wind_kph,this.wind_dir,this.pressure_mb,this.wind_mph,this.pressure_in});

  Weather.fromjson(Map<String,dynamic> json ){
    text=json["current"]["condition"]["text"];
    imageUrl=json["current"]["condition"]["icon"];
    temp_c=json["current"]["temp_c"];
    wind_kph=json["current"]["wind_kph"];
    wind_dir=json["current"]["wind_dir"];
    pressure_mb=json["current"]["pressure_mb"];
    wind_mph=json["current"]["wind_mph"];
    pressure_in=json["current"]["pressure_in"];
  }

}