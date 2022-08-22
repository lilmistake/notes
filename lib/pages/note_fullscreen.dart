import 'package:flutter/material.dart';
import 'package:notes/utility/color_pallet.dart';

class FullScreenNote extends StatelessWidget {
  final String title;
  final String desc;
  final int sno;
  const FullScreenNote(
      {Key? key, required this.title, required this.desc, required this.sno})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blurple,
        elevation: 0,
        title: Text('${sno.toString()}. $title'),
      ),
      backgroundColor: lightblack,
      body: ListView(
        children: [
          Container(
            alignment: Alignment.topLeft,
            color: Colors.black,
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            alignment: Alignment.topLeft,
            child: Text(
              desc,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
