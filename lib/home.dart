// //import 'dart:html';  //Dont import this import

// import 'package:chatapp/messages.dart';
// import 'package:chatapp/newMessage.dart';
// import 'package:chatapp/user.dart';
// import 'package:chatapp/userlist.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';


// class Home extends StatelessWidget {
   
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Welcome'),
//         actions: [
//           new IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: (){
//               signOut();
//               Navigator.pop(context);
//             }, 
//             )
//         ],
      
//       ),
//     body: Container(
//       //child: UserList(),
//     child: Column(
//       children: [
//         Expanded(
//           child: Messages(),
//           ),
//           NewMessage(),
//       ],
//     ),
//     )
//     );
//   }
// }
   