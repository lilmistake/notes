import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:notes/pages/pages.dart';
import 'package:notes/utility/utility.dart';
import 'package:notes/models/models.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

class CreateEditNote extends StatelessWidget {
  final Note? currentNote;
  final QuillController? controller;
  final String title;
  final Function dbFunc;
  const CreateEditNote(
      {super.key,
      this.currentNote,
      required this.title,
      this.controller,
      required this.dbFunc});
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final titleController =
        TextEditingController(text: currentNote?.title ?? '');
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        titleTextStyle:
            TextStyle(color: Theme.of(context).colorScheme.onSecondary),
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.onSecondary),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
              cursorColor: Theme.of(context).colorScheme.onBackground,
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
            const Divider(
              height: 40,
              color: Colors.transparent,
            ),
            QuillToolbar.basic(
              toolbarIconSize: 30,
              toolbarIconAlignment: WrapAlignment.start,
              controller: controller!,
              toolbarSectionSpacing: 0,
              showCameraButton: false,
              showClearFormat: false,
              showBackgroundColorButton: false,
              showFontFamily: false,
              showImageButton: false,
              showStrikeThrough: false,
              showVideoButton: false,
              showListBullets: false,
              showListCheck: false,
              showAlignmentButtons: false,
              showQuote: false,
              showSearchButton: false,
              showLink: false,
              showLeftAlignment: false,
              showRightAlignment: false,
              showIndent: false,
              showFontSize: false,
              showColorButton: false,
              showInlineCode: false,
            ),
            Container(
              constraints: const BoxConstraints(minHeight: 200),
              padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: DefaultTextStyle(
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontFamily: Theme.of(context).textTheme.displayLarge!.fontFamily
                      ),
                  child: QuillEditor(
                    controller: controller!,
                    scrollController: ScrollController(),
                    scrollable: true,
                    focusNode: FocusNode(),
                    autoFocus: true,
                    readOnly: false,
                    expands: false,
                    padding: EdgeInsets.zero,
                  )),
            ),
            Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.navigate_next_outlined,
                      color: Theme.of(context).colorScheme.onBackground,
                      size: 50,
                    ),
                    onPressed: () async {
                      final note = <String, dynamic>{
                        'title': titleController.text,
                        'description  ':
                            jsonEncode(controller!.document.toDelta().toJson()),
                        'ts': currentNote?.ts ??
                            DateTime.now().millisecondsSinceEpoch
                      };

                      if (note['title'].toString().isEmpty ||
                          note['description'].toString().isEmpty) {
                        return showDialog(
                            context: context,
                            builder: ((BuildContext context) {
                              return AlertDialog(
                                actions: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: const Text(
                                        "ok",
                                        style: TextStyle(color: Colors.white),
                                      ))
                                ],
                                backgroundColor:
                                    const Color.fromARGB(255, 19, 19, 19),
                                icon: const Icon(
                                  Icons.warning,
                                  color: Colors.yellow,
                                ),
                                title: const Text(
                                  "Title and description cannot be empty",
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }));
                      }
                      dbFunc(note: note);

                      Navigator.of(context).pushAndRemoveUntil(
                          pageTransition(
                              destination: const HomePage(),
                              direction: TransitionDirection.LEFT_TO_RIGHT),
                          (route) => false);
                    })),
          ],
        ),
      ),
    );
  }
}
