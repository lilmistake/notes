import 'package:cloud_firestore/cloud_firestore.dart';

var db = FirebaseFirestore.instance;

Future addNote({note}) async {
  var res = await db.collection('users').add(note);
  return res;
}

Future getAllNotes() async {
  var data = await db.collection('users').get();
  print(data);
  return data;
}
