import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'components/components.dart';
import 'package:notes/pages/settings/theme_changer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var gotData = false;
  List<Widget> notesPreview = [];

  getNotesPreview() async {
    List<Widget> response = await notesPreviewMaker(context);
    setState(() {
      gotData = true;
      notesPreview = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!gotData) getNotesPreview();
    return MaterialApp(
      theme: context.watch<ThemeChanger>().theme,
      debugShowCheckedModeBanner: false,
      home: HomeBody(gotData: gotData, notesPreview: notesPreview),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key, required this.gotData, required this.notesPreview})
      : super(key: key);
  final bool gotData;
  final List<Widget> notesPreview;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const MyAppBar(),
      body: Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
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
      floatingActionButton: const CreateNoteButton(),
    );
  }
}
