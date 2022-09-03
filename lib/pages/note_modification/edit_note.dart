import 'package:flutter/material.dart';
import 'package:notes/pages/note_modification/form_template.dart';
import 'package:notes/models/models.dart';
import 'dart:convert';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:notes/utility/utility.dart';

class EditNote extends StatefulWidget {
  final Note currentNote;

  const EditNote({Key? key, required this.currentNote}) : super(key: key);
  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  @override
  Widget build(BuildContext context) {
    final QuillController controller = QuillController(
        document: Document.fromJson(jsonDecode(widget.currentNote.description)),
        selection: const TextSelection.collapsed(offset: 0));

    return CreateEditNote(
      currentNote: widget.currentNote,
      title: 'Edit note',
      controller: controller,
      dbFunc: editNote,
    );
  }
}
