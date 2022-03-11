
import 'package:flutter/material.dart';

class Data{
  String? text;
  DateTime? dateTime;
  String? name;
  String? img;
  String? userId;

  Data(
    @required this.text, 
    @required this.dateTime, 
    @required this.name, 
    @required this.img);

  Data.fromJson(Map<dynamic, dynamic> json) 
    :  dateTime = DateTime.parse(json['datetime']??""),
    text = json['text']??"",
    name = json['name']??"",
    img =  json['img']??"";

    Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
      'datetime' : dateTime.toString(),
      'text' : text,
      'name' : name,
      'img' : img,
    } ;
}