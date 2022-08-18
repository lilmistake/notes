import 'package:flutter/material.dart';
import 'package:notes/utility/color_pallet.dart';
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
          color: lightblack,
        ),
        bottomNavigationBar: const MyBottomNavBar()
      ),
    );
  }
}
