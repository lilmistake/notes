import 'package:flutter/material.dart';
import 'package:notes/utility/page_transition.dart';
import '../../pages.dart';

class CreateNoteButton extends StatelessWidget {
  const CreateNoteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        child: Icon(
          Icons.add,
          size: 50,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        onPressed: () {
          Navigator.of(context).push(pageTransition(
              destination: const CreateNote(),
              direction: TransitionDirection.DOWN_TO_UP));
        });
  }
}
