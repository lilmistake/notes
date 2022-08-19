import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/utility/color_pallet.dart';
import 'components/components.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

var db = FirebaseFirestore.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  //testingDb();
}

void testingDb() {
  final user = <String, dynamic>{
    'first': '200',
    'last': 418,
  };
  db.collection('users').add(user).then((value) => print(value));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: const MyAppBar(),
          body: Container(
            color: lightblack,
          ),
          bottomNavigationBar: const MyBottomNavBar()),
    );
  }
}
