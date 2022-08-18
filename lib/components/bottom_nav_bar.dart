import 'package:flutter/material.dart';
import 'package:notes/utility/color_pallet.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          blurple,
        ),
      ),
      child: const Icon(
        Icons.add,
        size: 50,
      ),
      onPressed: () {
        print("Button was pressed");
      },
    );
  }
}
