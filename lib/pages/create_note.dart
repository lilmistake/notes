import 'package:flutter/material.dart';
import 'package:notes/pages/pages.dart';
import 'package:notes/utility/page_transition.dart';
import 'package:notes/utility/utility.dart';
import 'package:notes/models/models.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({Key? key}) : super(key: key);
  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Create new note"),
        ),
        
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                MyInputTextFeild(field: 'Title', controller: titleController),
                MyInputTextFeild(
                  field: 'Description',
                  controller: descriptionController,
                  minLines: 6,
                  maxLines: 20,
                ),
                const Divider(),
                Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.navigate_next_outlined,
                          size: 50,
                        ),
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) return;
                          final note = <String, dynamic>{
                            'title': titleController.text,
                            'desc': descriptionController.text
                          };
                          addNote(note: note);
                          await Navigator.of(context).push(pageTransition(
                              destination: const HomePage(),
                              direction: TransitionDirection.LEFT_TO_RIGHT));
                        })),
              ],
            ),
          ),
        ));
  }
}
//todo arrange notes with timestamp created instead of serial number. (Put serial number later)