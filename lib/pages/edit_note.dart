import 'package:flutter/material.dart';
import 'package:notes/pages/pages.dart';
import 'package:notes/utility/page_transition.dart';
import 'package:notes/utility/utility.dart';
import 'package:notes/models/models.dart';
import 'home.dart';

class EditNote extends StatefulWidget {
  final Note currentNote;

  const EditNote({Key? key, required this.currentNote}) : super(key: key);
  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final titleController =
        TextEditingController(text: widget.currentNote.title);
    final descriptionController =
        TextEditingController(text: widget.currentNote.description);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit note"),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
          iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.onSecondary
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
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
                        icon: Icon(
                          Icons.navigate_next_outlined,
                          color: Theme.of(context).colorScheme.onBackground,
                          size: 50,
                        ),
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) return;
                          final note = <String, dynamic>{
                            'title': titleController.text,
                            'description  ': descriptionController.text,
                            'ts': widget.currentNote.ts
                          };                       

                          editNote(note: note);
                          Navigator.of(context).pushAndRemoveUntil(
                              pageTransition(
                                  destination: const HomePage(),
                                  direction: TransitionDirection.LEFT_TO_RIGHT),
                              (route) => false);
                              
                        })),
              ],
            ),
          ),
        ));
  }
}
