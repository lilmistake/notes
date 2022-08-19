import 'package:flutter/material.dart';
import 'package:notes/utility/color_pallet.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({Key? key}) : super(key: key);

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

inputFieldDecor(label) {
  return InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(color: Colors.white, fontSize: 20),
    floatingLabelStyle: const TextStyle(color: Colors.white, fontSize: 20),    
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 3, color: Colors.white),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 3, color: blurple),
    ),
  );
}

class _CreateNoteState extends State<CreateNote> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String noteContent = '';
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
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    onChanged: (String value) {
                      title = value;
                    },
                    cursorColor: Colors.white,
                    decoration: inputFieldDecor('Title'),
                  ),
                ),
                const Divider(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    onChanged: (String value) {
                      noteContent = value;
                    },
                    minLines: 6,
                    maxLines: 20,
                    cursorColor: Colors.white,
                    decoration: inputFieldDecor("Description"),
                  ),
                ),
                const Divider(
                  height: 20,
                ),
                Container(                                    
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: blurple,                    
                  ),
                  
                  child: IconButton(                                        
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      print(title);
                      print(noteContent);
                    },
                    icon: const Icon(
                      Icons.navigate_next_outlined,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
