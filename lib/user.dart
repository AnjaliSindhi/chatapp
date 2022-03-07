import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String? name, email, imageUrl;



  Future<String> signInWithGoogle() async {
  final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication googleAuth = await googleuser!.authentication;

  final credential = GoogleAuthProvider.credential(
    idToken: googleAuth.idToken,
    accessToken: googleAuth.accessToken,
  );


  final UserCredential authResult = await _auth.signInWithCredential(credential);
  final User? user = authResult.user;

  assert(user?.email != null);
  assert(user?.displayName != null);
  //assert(user?.imageUrl != null);

  name = user?.displayName;
  email = user?.email;
  imageUrl = user?.photoURL;

  final User? currentUser =  _auth.currentUser;
  assert(user?.uid == currentUser!.uid);
   
  return 'signInWithGoogle succeeded : $User';
}

void signOut() async{
  await googleSignIn.signOut();
  
  print ("User Sign out");
  
}
