import 'package:chatapp/dataBubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:chatapp/datawidget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../user.dart';
import '../data.dart';
import '../newdata.dart';


class DataList extends StatefulWidget {
  
  final newdata = NewData();

  @override
  _DataListState createState() => _DataListState();
}

class _DataListState extends State<DataList> { 
User user =  FirebaseAuth.instance.currentUser!;
final DatabaseReference _reference = FirebaseDatabase.instance.ref().child('msgs');  

  ScrollController _scrollController = ScrollController();
  TextEditingController _msgController = TextEditingController();


  

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollDown());

    return Scaffold(
      appBar: AppBar(title: Text('Chat App'),
      actions: [
          new IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async{
              await googleSignIn.signOut();
              Navigator.pop(context);
            }, 
            )
        ],
      

      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
              _getMessageList(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12) ,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: _msgController,
                        onChanged: (text) => setState(() {}),
                        onSubmitted: (input) {
                          _sendmsg();
                        },
                        decoration: const InputDecoration(
                          hintText: "Message...",
                        ),
                      ),
                      )
                      ),
                      IconButton(
                        onPressed: (){
                          _sendmsg();
                        }, 
                        icon: Icon(
                          _icansendmsg()? CupertinoIcons.arrow_right_circle_fill: CupertinoIcons.arrow_right_circle),
                          color: Theme.of(context).colorScheme.secondary,
                          ),
                ],
              )
        ]),
        ),
    );
  }

  void _sendmsg(){
    if(_icansendmsg()){
      final msg = Data(_msgController.text, DateTime.now());
      widget.newdata.saveMessage(msg);
      _msgController.clear();
      setState(() {
      });
      }
  }

  bool _icansendmsg() => _msgController.text.length > 0 ;

  Widget _getMessageList(){
    return Expanded(
      child: FirebaseAnimatedList(
        controller: _scrollController,
        query: widget.newdata.getMessage(),
        itemBuilder: (context , snapshot , animation ,index){
          final json =snapshot.value as  Map<dynamic, dynamic>;
          final data = Data.fromJson(json);
          //return DataWidget(data.text , data.dateTime);
          return DataBubble(data.text! , data.dateTime, _reference.key == user.uid);
        }
      ),
      );
  }

  void _scrollDown(){
    if(_scrollController.hasClients){
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

}