import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/models/models.dart';
import 'package:notes/pages/note_fullscreen.dart';
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
          Navigator.of(context).push(PageRouteBuilder(
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
              pageBuilder: ((context, animation, secondaryAnimation) =>
                  FullScreenNote(
                    currentNote: currentNote,
                  ))));
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
