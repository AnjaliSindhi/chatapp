import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataWidget extends StatelessWidget {
  final String? text;
  final DateTime? dateTime;

  DataWidget(this.text, this.dateTime, );


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 1, top: 5, right: 1, bottom: 2),
      child: Column(
        children: [
          Container(
            width: 350,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[350]!,
                  blurRadius: 2.0,
                  offset: Offset(0,1.0),
                )
              ],
              borderRadius: BorderRadius.circular(100),
              color: Colors.black12,
            ),

            child: MaterialButton(
              disabledTextColor: Colors.black87,
              padding: EdgeInsets.only(left: 18),
              onPressed: null,
              child: Wrap(children: <Widget>[
                Container(
                  child: Row(children: [
                    Text(text!),
                  ]),
                )
              ]),
            ),

          ),

          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                DateFormat('kk:mma,dd-MM-yyyy').format(dateTime!).toString(),
                style: TextStyle(color: Colors.grey),
              ),
            ),
          )
        ]),
    );
  }
}