import 'package:flutter/material.dart';
import 'package:notes/pages/pages.dart';
import 'package:notes/utility/utility.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/models/models.dart';
class CreateNote extends StatefulWidget {
  const CreateNote({Key? key}) : super(key: key);
  @override
  State<CreateNote> createState() => _CreateNoteState();
}

var db2 = FirebaseFirestore.instance;

class _CreateNoteState extends State<CreateNote> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
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
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;
                      final note = <String, dynamic>{
                        'title': titleController.text,
                        'desc': descriptionController.text
                      };
                      db2
                          .collection('users')
                          .add(note)
                          .then((value) => print('Added note'))
                          .then((value) {
                        Navigator.of(context)
                            .push(PageRouteBuilder(
                                pageBuilder:
                                    ((context, animation, secondaryAnimation) =>
                                        const HomePage())))
                            .then((value) => setState(() {}));
                      });
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

