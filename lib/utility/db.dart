import 'package:cloud_firestore/cloud_firestore.dart';

int documentCount = 0;
var db = FirebaseFirestore.instance;

Future addNote({note}) async {  
  var res = await db.collection('notes').add(note);
  return res;
}

Future editNote({note, ref}) async {
  var res = await db.collection('notes').doc(ref).update(note);
  return res;
}

Future getAllNotes() async {
  var data = await db.collection('notes').orderBy('ts', descending: true).get();
  documentCount = data.docs.length;
  return data;
}
