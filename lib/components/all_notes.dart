import 'package:flutter/material.dart';
import 'package:notes/pages/note_fullscreen.dart';
import 'package:notes/utility/utility.dart';

Future notesPreviewMaker(context) async {
  List<Widget> notes = [];

  await getAllNotes().then((notesData) {
    for (var i = 0; i < notesData.docs.length; i++) {
      var title = notesData.docs[i].data()['title'];
      var desc = notesData.docs[i].data()['desc'];
      var sno = notesData.docs[i].data()['sno'] ?? '';
      if (title == null ||
          title.toString().isEmpty ||
          desc == null ||
          desc.toString().isEmpty) continue;

      notes.add(
          noteContainer(desc: desc, sno: sno, title: title, context: context));
    }
  });
  return notes;
}

noteContainer({sno, title, desc, context}) {
  return Builder(builder: (context) {
    return InkWell(        
        onTap: () {          
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: ((context, animation, secondaryAnimation) =>
                  FullScreenNote(
                    title: title,
                    desc: desc,
                    sno: sno,
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
                '${sno.toString()}. $title',
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
              child: Text(desc,
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
