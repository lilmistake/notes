import 'package:flutter/material.dart';
import 'package:notes/utility/utility.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'form_template.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({Key? key}) : super(key: key);
  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  @override
  Widget build(BuildContext context) {
    final QuillController controller = QuillController.basic();
    return CreateEditNote(
      title: 'Create note',
      controller: controller,
      dbFunc: addNote,
    );
  }
  
}
