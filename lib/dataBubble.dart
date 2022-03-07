import 'package:flutter/material.dart';

class DataBubble extends StatelessWidget {

  final String text;
  final DateTime? dateTime;
  final bool isMe;

  //final Key key;
  DataBubble(this.text, this.dateTime,  this.isMe,);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isMe? Colors.grey[350]: Theme.of(context).colorScheme.secondary,
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
          
          child: Text(
            text, 
            style: TextStyle(color: isMe? Colors.black : Colors.white),),
        ),
      ],
    );
  }
}