import 'package:flutter/material.dart';
import 'components/components.dart';

void main() {
  runApp(const MyApp());
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
          color: const Color(0xff191919),
        ),
        bottomNavigationBar: const MyBottomNavBar()
      ),
    );
  }
}
