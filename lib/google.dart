import 'package:chatapp/user.dart';
import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = FirebaseFirestore.instance;

class Google extends StatelessWidget {
  const Google({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: GoogleAuthButton(
      darkMode: true,
      onPressed: () {
        signInWithGoogle().then((onValue) {
            _firestore.collection('users').add({
            'email' : email,
            'image' : imageUrl,
            'name' : name,
          });
        }).catchError((e){
          print(e);
        }).then((onValue){
          Navigator.pushNamed(context, '/datalist');
        });
      },
      ),
      );
        }
        }
        