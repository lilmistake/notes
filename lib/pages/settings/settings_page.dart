import 'package:flutter/material.dart';
import 'package:notes/utility/utility.dart';
import 'package:provider/provider.dart';
import 'package:notes/pages/settings/theme_changer.dart';

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
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.onSecondary),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          "Settings",
          style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          alignment: Alignment.center,
          child: Text(
            "Color Scheme",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
        Row(
          children: themeContainers(
              activeIndex: activeIndex,
              context: context,
              selectedTheme: themeSelected),
        ),
      ]),
    );
  }
}

themeContainers({required BuildContext context, activeIndex, selectedTheme}) {
  List<Expanded> themes = <Expanded>[];
  for (var i = 0; i < 3; i++) {
    Expanded currentExpanded = Expanded(
        child: Material(
            color: Theme.of(context).colorScheme.background,
            child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  context.read<ThemeChanger>().setTheme(i);
                  editTheme(i);
                  selectedTheme(i);
                  activeIndex = i;
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Theme changed successfully!"),
                  ));
                },
                child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 5,
                              offset: Offset(5, 5))
                        ],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: activeIndex == i
                                ? Colors.white
                                : Colors.transparent,
                            width: 3)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Image.asset('assets/images/${i + 1}.png'),
                    )))));
    themes.add(currentExpanded);
  }

  return themes;
}
