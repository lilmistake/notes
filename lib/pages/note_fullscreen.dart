import 'package:flutter/material.dart';
import 'package:notes/pages/pages.dart';
import 'package:notes/models/models.dart';

class FullScreenNote extends StatelessWidget {
  final Note currentNote;
  const FullScreenNote({Key? key, required this.currentNote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onSecondary),
        title: Text('${currentNote.sno.toString()}. ${currentNote.title}'),
        titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),            
            onPressed: () {
              Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: ((context, animation, secondaryAnimation) =>
                      EditNote(currentNote: currentNote,))));
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                    alignment: Alignment.topLeft,
                    color: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      currentNote.title,
                      style: TextStyle(color: Theme.of(context).colorScheme.onSecondary, fontSize: 40),
                    )),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    currentNote.description,
                    style: TextStyle(color: Theme.of(context).colorScheme.onBackground, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
