import 'package:flutter/material.dart';
import 'package:notes/pages/pages.dart';
import 'package:notes/utility/utility.dart';

class NoteActionButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  const NoteActionButton(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Theme.of(context).colorScheme.primary),
      child: IconButton(
        icon: Icon(icon, color: Theme.of(context).colorScheme.onPrimary),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}

confirmDeletion(context, currentNote) {
  showDialog(
      context: context,
      builder: ((BuildContext context) {
        return AlertDialog(
          title: const Text("Delete?"),
          content: const Text(
              "Are you sure you want to delete this note? This action cannot be undone."),
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.cancel)),
                const Text("cancel")
              ],
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      deleteNote(ts: currentNote.ts);
                      Navigator.of(context).pushAndRemoveUntil(
                          pageTransition(
                              destination: const HomePage(),
                              direction: TransitionDirection.LEFT_TO_RIGHT),
                          (route) => false);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    )),
                    const Text("delete")
              ],
            )
          ],
        );
      }));
}
