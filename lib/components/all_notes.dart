import 'package:flutter/material.dart';
import 'package:notes/models/models.dart';
import 'package:notes/pages/note_fullscreen.dart';
import 'package:notes/utility/page_transition.dart';
import 'package:notes/utility/utility.dart';

Future notesPreviewMaker(context) async {
  List<Widget> notesContainerList = [];

  await getAllNotes().then((notesData) {
    for (var i = 0; i < notesData.docs.length; i++) {
      var doc = notesData.docs[i].data();
      Note currentNote = Note(
          sno: doc['sno'],
          title: doc['title'],
          description: doc['desc'],
          refID: notesData.docs[i].reference.id);
      if (currentNote.isNull()) continue;
      notesContainerList
          .add(noteContainer(currentNote: currentNote, context: context));
    }
  });
  return notesContainerList;
}

noteContainer({required Note currentNote, context}) {
  return Builder(builder: (context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(pageTransition(destination:  FullScreenNote(currentNote: currentNote),direction: TransitionDirection.DOWN_TO_UP));
        },
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(maxHeight: double.infinity),
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: blurple,
              ),
              child: Text(
                '${currentNote.sno.toString()}. ${currentNote.title}',
                softWrap: false,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              constraints: const BoxConstraints(maxHeight: double.infinity),
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Colors.black,
              ),
              child: Text(currentNote.description,
                  softWrap: false,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  )),
            ),
          ],
        ));
  });
}
