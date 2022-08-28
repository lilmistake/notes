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
          title: doc['title'],
          description: doc['desc'],
          ts: doc['ts'],
          refID: notesData.docs[i].reference.id);
      if (currentNote.isNull()) continue;
      notesContainerList.add(noteContainer(
          currentNote: currentNote,
          context: context,
          index: notesData.docs.length - i));
    }
  });
  return notesContainerList;
}

noteContainer({required Note currentNote, context, index}) {
  var t = DateTime.fromMillisecondsSinceEpoch(currentNote.ts);
  return Builder(builder: (context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pushAndRemoveUntil(
            pageTransition(
                destination:
                    FullScreenNote(currentNote: currentNote, index: index),
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
                child: Text(
                  '${index.toString()}. ${currentNote.title}',
                  softWrap: false,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSecondary),
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
                      Text(currentNote.description,
                          softWrap: false,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.onPrimary)),
                              const Divider(thickness: 1,),
                      Text('${t.day}/${t.month}/${t.year} at ${t.hour}:${t.minute}', style: TextStyle(fontSize: 12, color: Colors.grey.shade800),)
                    ],
                  )),
            ],
          ),
        ));
  });
}
