import 'package:flutter/material.dart';

class MyPreloader extends StatelessWidget {
  const MyPreloader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 7,
            )));
  }
}
