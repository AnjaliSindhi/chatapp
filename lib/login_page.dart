//import 'dart:js';

import 'package:chatapp/google_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Social Login'),
      backgroundColor: Colors.grey,
      ),
      body: loginUI(),
    );
  }

  loginUI(){
    return Consumer<GoogleSignInController>(
      builder: (context, model, child){
        if(model.googleAccount !=null){
          return Center(child: loggedInUI(model),);
        }
        else
        {
          return loginControls(context);
        }
      },
      );
  }

  loggedInUI(GoogleSignInController model){
    return Column(
      mainAxisAlignment:MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: Image.network(model.googleAccount!.photoUrl??'').image,
          radius:  50,
        ),
        Text(model.googleAccount!.displayName?? ''),
        Text(model.googleAccount!.email),
        ActionChip(
          avatar: Icon(Icons.logout),
          label: Text('Logout'), 
          onPressed: (){
            Provider.of<GoogleSignInController>(this.context, listen: false).logout();
          }
          )
    ],);
  }

  loginControls(BuildContext context){
    return Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Image.asset('asset/images/google.png',
            width: 250,
            ),
            onTap: (){
              Provider.of<GoogleSignInController>(context, listen: false).login();
            },
          ),
          SizedBox(height: 20,),
          Image.asset(
            "asset/images/facebook.png",
            width: 250,
          ),
        ],
      ) ,
    );
  }

}