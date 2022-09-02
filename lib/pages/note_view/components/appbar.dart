import 'package:flutter/material.dart';
import 'package:notes/models/models.dart';
import 'package:notes/pages/note_modification/edit_note.dart';
import 'edit_delete_buttons.dart';

class NoteViewAppBar extends StatelessWidget with PreferredSizeWidget {
  final int index;
  final String timeAsString;
  final Note currentNote;
  const NoteViewAppBar(
      {super.key,
      required this.index,
      required this.timeAsString,
      required this.currentNote});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      elevation: 0,
      iconTheme:
          IconThemeData(color: Theme.of(context).colorScheme.onSecondary),
      title: Text(index.toString()),
      titleTextStyle:
          TextStyle(color: Theme.of(context).colorScheme.onSecondary),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          alignment: Alignment.centerRight,
          child: Text(
            'Created on $timeAsString',
            style: TextStyle(
                fontSize: 10, color: Theme.of(context).colorScheme.onSecondary),
          ),
        ),
        NoteActionButton(
            icon: Icons.delete,
            onPressed: () {
              confirmDeletion(context, currentNote);
            }),
        NoteActionButton(
            icon: Icons.edit,
            onPressed: () {
              Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: ((context, animation, secondaryAnimation) =>
                      EditNote(
                        currentNote: currentNote,
                      ))));
            }),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
