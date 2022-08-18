import 'package:flutter/material.dart';
import 'package:notes/utility/color_pallet.dart';

class CreateNote extends StatelessWidget {
  const CreateNote({Key? key}) : super(key: key);
  final TextStyle inputFieldStyle = const TextStyle(color: Colors.white, fontSize: 25);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: blurple,
          title: const Text("Create new note"),
        ),
        backgroundColor: lightblack,
        body: Container(
          margin: const EdgeInsets.only(top: 20),
          child: ListView(
            children: [
               TextField(
                style: inputFieldStyle,                
                decoration: InputDecoration(                  
                    hintStyle: inputFieldStyle,
                    fillColor: Colors.white,
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: blurple),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: blurple),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Enter title'),
              ),

              const Divider(
                height: 20,
              ),

              TextField(
                minLines: 6,
                style: inputFieldStyle,
                maxLines: 20,
                decoration: InputDecoration(
                    hintStyle: inputFieldStyle,
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: blurple),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: blurple),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Enter note'),
              ),
            ],
          ),
        ));
  }
}
