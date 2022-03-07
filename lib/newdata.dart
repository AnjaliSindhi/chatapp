import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'data.dart';

class NewData{

  final DatabaseReference _reference = FirebaseDatabase.instance.ref().child('msgs');

  void saveMessage(Data dt){
    _reference.push().set(dt.toJson());
  }

  Query getMessage() => _reference;
}