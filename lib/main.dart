
import 'package:chatapp/datalist.dart';
import 'package:chatapp/google.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Login Page'),),
      
        body: Google(),
        //body: DataList(),
      ),

      routes: {
        '/datalist' : (context) => DataList(),
      },
      debugShowCheckedModeBanner: false, 
    ); 
  }
}