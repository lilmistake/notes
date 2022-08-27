import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:notes/main.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int activeIndex = 0;
  void themeSelected(index) {
    activeIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    activeIndex = context.watch<ThemeChanger>().currentThemeIndex;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(children: [
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              "Select theme:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.onPrimary,
            thickness: 1,
          ),
          Row(
            children: themeContainers(
                activeIndex: activeIndex,
                context: context,
                selectedTheme: themeSelected),
          )
        ]),
      ),
    );
  }
}

themeContainers({required BuildContext context, activeIndex, selectedTheme}) {
  List<Color> themeColors = <Color>[Colors.red, Colors.black, Colors.blue];
  List<Expanded> themes = <Expanded>[];
  for (var i = 0; i < themeColors.length; i++) {
    Expanded currentExpanded = Expanded(
        child: Material(
            color: Theme.of(context).colorScheme.background,
            child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  context.read<ThemeChanger>().setTheme(i);
                  selectedTheme(i);
                  activeIndex = i;
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Theme changed successfully!"),
                  ));
                },
                child: Container(
                    margin: const EdgeInsets.all(5),
                    child: Ink(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: themeColors[i],
                          border: Border.all(
                              color: activeIndex == i
                                  ? Colors.black
                                  : Theme.of(context).colorScheme.primary,
                              width: 3)),
                      height: 80,
                    )))));
    themes.add(currentExpanded);
  }

  return themes;
}
