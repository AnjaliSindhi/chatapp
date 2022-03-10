import 'package:flutter/material.dart';

class Data{
  String? text;
  String? userId;
  DateTime? dateTime;
  String? name;
  String? img;

  Data(this.text, this.dateTime, this.name);

  Data.fromJson(Map<dynamic, dynamic> json) 
    :  dateTime = DateTime.parse(json['datetime'] as String),
    text = json['text'] as String,
    name = json['name'] as String;
    //img =  json['img'] as String;

    Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
      'datetime' : dateTime.toString(),
      'text' : text,
      'name' : name,
      //'img' : img,
    } ;
}