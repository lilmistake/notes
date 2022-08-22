import 'package:flutter/material.dart';
import 'package:notes/utility/utility.dart';
import 'package:notes/components/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

var db = FirebaseFirestore.instance;

class _HomePageState extends State<HomePage> {
  var gotData = false;
  List<Widget> notesPreview = [];

  getNotesPreview() async {
    List<Widget> response = await notesPreviewMaker(db);
    setState(() {
      gotData = true;
      notesPreview = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!gotData) getNotesPreview();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: const MyAppBar(),
          body: Container(
            color: lightblack,
            child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: gotData
                    ? MasonryGridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        itemBuilder: (context, index) {
                          if (index == notesPreview.length) return Container();
                          return notesPreview[index];
                        },
                        itemCount: notesPreview.length,
                    )
                    : const MyPreloader()),
          ),
          bottomNavigationBar: const MyBottomNavBar()),
    );
  }
}
