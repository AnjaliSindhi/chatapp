// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';

import 'package:chatapp/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'data.dart';

class DataBubble extends StatelessWidget {

  final String text;
  final DateTime? dateTime;
  final String img;
  final bool isMe;

  //final Key key;
  DataBubble(this.text, this.dateTime, this.isMe, this.img);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isMe? Colors.grey[400]: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(12),
              bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
            ),
          ),
          width: 140,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          
          child: Column(
            children: [

             if( text == text )
              Text(
                text+'\n\n'+img+'\n'+(DateFormat('kk:mma,dd-mm').format(dateTime!).toString()),
                style: TextStyle(color: isMe? Colors.black : Colors.white , fontWeight: FontWeight.bold),
                ),
                
              
             if(text == img)
              Container(
                height: 30,
                width: 30,
                child: Image.network(img),
              ),
              
              
            ],
          ),
        ),
      ],
    );
  }
}

