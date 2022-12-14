import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:notes/models/models.dart';
import 'package:notes/pages/pages.dart';
import 'package:notes/utility/utility.dart';

Future notesPreviewMaker(context) async {
  List<Widget> notesContainerList = [];
  int sno = 1;
  await getAllNotes().then((notesData) {
    for (var i = 0; i < notesData.length; i++) {
      var doc = notesData[i];
      Note currentNote = Note(
        title: doc['title'],
        description: doc['description'],
        ts: doc['ts'],
      );
      if (currentNote.isNull()) continue;
      var newNote =
          noteContainer(currentNote: currentNote, context: context, index: sno);

      if (newNote == null) continue;
      sno += 1;

      notesContainerList.add(newNote);
    }
  });

  return notesContainerList.reversed.toList();
}

noteContainer({required Note currentNote, context, index}) {
  List jsonData = [];
  try {
    jsonData = jsonDecode(currentNote.description);
  } catch (e) {
    // ignored
  }
  if (jsonData.isEmpty) return;
  QuillController _controller = QuillController(
      document: Document.fromJson(jsonData),
      selection: const TextSelection.collapsed(offset: 0));

  var t = DateTime.fromMillisecondsSinceEpoch(currentNote.ts);
  String timeOfNoteCreation =
      '${t.day}/${t.month}/${t.year} at ${t.hour}:${t.minute}';
  return Builder(builder: (context) {
    return InkWell(      
      onTap: () {
        Navigator.of(context).pushAndRemoveUntil(
          pageTransition(
              destination: FullScreenNote(
                  currentNote: currentNote,
                  index: index,
                  time: timeOfNoteCreation,
                  controller: _controller),
              direction: TransitionDirection.DOWN_TO_UP),
          (route) => route.isFirst,
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
                color: Theme.of(context).colorScheme.secondary, width: 3)),
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(maxHeight: double.infinity),
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              color: Theme.of(context).colorScheme.secondary,
              child: Wrap(
                children: [
                  Text(
                    '${index.toString()}. ${currentNote.title}',
                    softWrap: false,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSecondary),
                  ),
                ],
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Theme.of(context).colorScheme.primary,
                ),
                constraints: const BoxConstraints(maxHeight: double.infinity),
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxHeight: 200),
                      child: AbsorbPointer(
                        child: QuillEditor.basic(
                          controller: _controller,
                          readOnly: true,
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    Text(
                      timeOfNoteCreation,
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade800),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  });
}
