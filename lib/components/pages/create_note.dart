import 'package:flutter/material.dart';
import 'package:notes/utility/color_pallet.dart';

class CreateNote extends StatelessWidget {
  const CreateNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blurple,
        title: const Text("Create new note"),
      ),
    );
  }
}
