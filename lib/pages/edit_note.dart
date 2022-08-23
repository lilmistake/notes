import 'package:flutter/material.dart';
import 'package:notes/pages/pages.dart';
import 'package:notes/utility/utility.dart';
import 'package:notes/models/models.dart';

class EditNote extends StatefulWidget {
  final Note currentNote;
  
  const EditNote({Key? key, required this.currentNote})
      : super(key: key);
  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: widget.currentNote.title);
    final descriptionController = TextEditingController(text: widget.currentNote.description);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: blurple,
          title: const Text("Edit note"),
        ),
        backgroundColor: lightblack,
        body: Container(
          margin: const EdgeInsets.only(top: 20),
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
                      color: blurple,
                    ),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.navigate_next_outlined,
                          size: 50,
                          color: Colors.black,
                        ),
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) return;
                          final note = <String, dynamic>{
                            'title': titleController.text,
                            'desc': descriptionController.text
                          };
                          editNote(note: note, ref: widget.currentNote.refID);
                          await Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder:
                                  ((context, animation, secondaryAnimation) =>
                                      const HomePage())));                          
                        })),
              ],
            ),
          ),
        ));
  }
}
