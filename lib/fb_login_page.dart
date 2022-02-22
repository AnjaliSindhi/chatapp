//import 'dart:js';

import 'package:chatapp/facebook_login_controller.dart';
import 'package:chatapp/google_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FacebookLoginPage extends StatefulWidget {
  const FacebookLoginPage({ Key? key }) : super(key: key);

  @override
  _FacebookLoginPageState createState() => _FacebookLoginPageState();
}

class _FacebookLoginPageState extends State<FacebookLoginPage> {
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
    return Consumer<FacebookSignInController>(
      builder: (context, model, child){
        if(model.userData !=null){
          return Center(child: loggedInUI(model),);
        }
        else
        {
          return loginControls(context);
        }
      },
      );
  }

  loggedInUI(FacebookSignInController model){
    return Column(
      mainAxisAlignment:MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      //   CircleAvatar(
      //     backgroundImage: Image.network(model.googleAccount!.photoUrl??'').image,
      //     radius:  50,
      //   ),
        Text(model.userData!["name"]?? ''),
        Text(model.userData!["email"]),
        ActionChip(
          avatar: Icon(Icons.logout),
          label: Text('Logout'), 
          onPressed: (){
            Provider.of<FacebookSignInController>(this.context, listen: false).logOut();
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
              Provider.of<GoogleSignInController>(this.context, listen: false).login();
            },
          ),

          GestureDetector(
            child: Image.asset('asset/images/facebook.png',
            width: 250,
            ),
            onTap: (){
              Provider.of<FacebookSignInController>(this.context, listen: false).login();
            },
          ),
        ],
      ) ,
    );
  }

}