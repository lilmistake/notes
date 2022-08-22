import 'package:flutter/material.dart';
import '../utility/color_pallet.dart';

Future notesPreviewMaker(db) async {
  List<Widget> notes = [];

  await db.collection('users').get().then((notesData) {
    for (var i = 0; i < notesData.docs.length; i++) {
      var title = notesData.docs[i].data()['title'];
      var desc = notesData.docs[i].data()['desc'];
      if (title == null || desc == null) continue;

      Column currentContainer = Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxHeight: double.infinity),
            width: double.infinity,
            padding: const EdgeInsets.all(5),

            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: blurple,
            ),            
            
            child: Text(
              title,
              softWrap: false,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
            
            child: Text(
              desc,
                softWrap: false,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
          ),
        ],
      );
      notes.add(currentContainer);
    }
  });
  return notes;
}
