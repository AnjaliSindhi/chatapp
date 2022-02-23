
import 'package:chatapp/facebook_login_controller.dart';
//import 'package:chatapp/fb_login_page.dart';
import 'package:chatapp/google_login_controller.dart';
import 'package:chatapp/login_page.dart';
//import 'package:chatapp/screens/signin.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

//import './screens/chat_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GoogleSignInController(),
          child: LoginPage() ,
          ),

        ChangeNotifierProvider(
          create: (context) => FacebookSignInController(),
          child: LoginPage() ,
          ),

    ],
    child: MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    ), 
    ); 
  }
}

