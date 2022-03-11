import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' ;
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uuid/uuid.dart';

import 'package:chatapp/datawidget.dart';
import 'package:chatapp/dataBubble.dart';
import '../user.dart';
import '../data.dart';
import '../newdata.dart';



class DataList extends StatefulWidget {
  
  final newdata = NewData();

  @override
  _DataListState createState() => _DataListState();
}

class _DataListState extends State<DataList> { 
 
FirebaseStorage storage = FirebaseStorage.instance; 
late File imgFile;
late String imgUrl;  
 

 String? mailid =  FirebaseAuth.instance.currentUser!.email;
 User? _user;
//final DatabaseReference _reference = FirebaseDatabase.instance.ref().child('msgs');  

  ScrollController _scrollController = ScrollController();
  TextEditingController _msgController = TextEditingController();

@override
  void initState() {
    super.initState();
    _updateUser(FirebaseAuth.instance.currentUser!);
  }

  void _updateUser(User user){
    setState(() {
      _user = user;
    });
  }
  

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
                        decoration: InputDecoration(
                          hintText: "Message...",
                          suffixIcon: IconButton( 
                            icon:  const Icon(Icons.photo),
                            onPressed: () {
                              print('it works');
                              _getImage();
                            },
                            ),
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

Future _getImage() async {
 ImagePicker _img = ImagePicker();
 await _img.pickImage(source: ImageSource.gallery).then((file){
        if(file!= null){
          imgFile = File(file.path) ; 
          uploadImage();
        }
 });
}

Future uploadImage()async {
    String fileName = Uuid().v1();
    var ref = FirebaseStorage.instance.ref().child('images').child("$fileName.jpg");
    var uploadTask = await ref.putFile(imgFile);
    imgUrl = await uploadTask.ref.getDownloadURL();
    print(imgUrl);
  }

  void _sendmsg(){
    if(_icansendmsg()){
      final msg = Data(_msgController.text, DateTime.now(), name, imgUrl);
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
        //reverse: true,
        
        controller: _scrollController,
        query: widget.newdata.getMessage(),
        itemBuilder: (context , snapshot , animation ,index){
          final json =snapshot.value as  Map<dynamic, dynamic>;
          final data = Data.fromJson(json);
          //return DataWidget(data.text , data.dateTime);
          //return DataBubble(data.text! , data.dateTime!, imgUrl!,  _reference.key == _user!.uid);
          return DataBubble(data.text! , data.dateTime!,  data.name == _user!.displayName, imgUrl);
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
