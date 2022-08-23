import 'package:cloud_firestore/cloud_firestore.dart';

int documentCount = 0;
var db = FirebaseFirestore.instance;

Future addNote({note}) async {
  note['sno'] = documentCount + 1;
  var res = await db.collection('note').add(note);
  return res;
}

Future editNote({note, ref}) async {
  var res = await db.collection('note').doc(ref).update(note);
  return res;
}

Future getAllNotes() async {
  var data = await db.collection('note').orderBy('sno', descending: true).get();
  documentCount = data.docs.length;
  return data;
}
