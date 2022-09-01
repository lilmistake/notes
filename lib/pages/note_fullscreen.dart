import 'package:flutter/material.dart';
import 'package:notes/pages/pages.dart';
import 'package:notes/models/models.dart';

class PagePainter extends CustomPainter {
  final BuildContext context;
  final String text;
  final TextStyle style;
  PagePainter({required this.context, required this.text, required this.style});

  @override
  void paint(Canvas canvas, Size size) {
    final blackLines = Paint()
      ..color = Theme.of(context).colorScheme.onBackground
      ..strokeWidth = 0.5;

    TextPainter t = TextPainter(
        text: TextSpan(text: text, style: style),
        textDirection: TextDirection.ltr);
    t.layout(
        maxWidth:
            MediaQuery.of(context).size.width - 30); // - margin on both sides
    for (var i = 0; i < t.computeLineMetrics().length; i++) {
      canvas.drawLine(Offset(0, size.height * (i + 1) * 0.2),
          Offset(size.width, size.height * (i + 1) * 0.2), blackLines);
    }
  }

  @override
  bool shouldRepaint(PagePainter oldDelegate) {
    return false;
  }
}

class FullScreenNote extends StatelessWidget {
  final Note currentNote;
  final TextStyle noteDescStyle = const TextStyle(fontSize: 25, height: 1.2);
  final int index;
  final String time;
  const FullScreenNote(
      {Key? key,
      required this.currentNote,
      required this.index,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              time,
              style: TextStyle(
                  fontSize: 10,
                  color: Theme.of(context).colorScheme.onSecondary),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary),
            child: IconButton(
              icon: Icon(Icons.edit,
                  color: Theme.of(context).colorScheme.onPrimary),
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: ((context, animation, secondaryAnimation) =>
                        EditNote(
                          currentNote: currentNote,
                        ))));
              },
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          DefaultTextStyle(
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onSecondary),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.secondary),
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            currentNote.title,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Divider(height: 10),
                    Stack(
                      children: [
                        CustomPaint(
                            foregroundPainter: PagePainter(
                                context: context,
                                text: currentNote.description,
                                style: noteDescStyle),
                            child: Container(
                              height: (noteDescStyle.height! * 100) *
                                  (noteDescStyle.fontSize! /
                                      20), // gap between lines
                            )),
                        Text(
                          currentNote.description,
                          style: noteDescStyle,
                        )
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
