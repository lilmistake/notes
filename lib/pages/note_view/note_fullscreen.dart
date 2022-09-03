import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:notes/pages/note_view/components/appbar.dart';
import 'package:notes/models/models.dart';

class FullScreenNote extends StatelessWidget {
  final Note currentNote;
  final int index;
  final String time;
  final QuillController controller;
  const FullScreenNote(
      {Key? key,
      required this.currentNote,
      required this.index,
      required this.controller,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: NoteViewAppBar(
          currentNote: currentNote, index: index, timeAsString: time),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.secondary),
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        currentNote.title,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    )
                  ],
                ),
                const Divider(height: 10),
                DefaultTextStyle(
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary),
                  child: QuillEditor(
                    controller: controller,
                    scrollController: ScrollController(),
                    showCursor: false,
                    scrollable: true,
                    focusNode: FocusNode(),
                    autoFocus: true,
                    readOnly: true,
                    expands: false,
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
