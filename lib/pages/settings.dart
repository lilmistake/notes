import 'package:flutter/material.dart';

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
    return Scaffold(      
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        color: Theme.of(context).colorScheme.primary,
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
            children: themeContainers(activeIndex: activeIndex, context: context, selectedTheme: themeSelected),
          )
        ]),
      ),
    );
  }
}

themeContainers({context, activeIndex, selectedTheme}) {
  List<Color> themeColors = <Color>[Colors.black, Colors.red, Colors.blue];
  List<Expanded> themes = <Expanded>[];
  for (var i = 0; i < themeColors.length; i++) {
    Expanded currentExpanded = Expanded(
        child: Material(
            child: InkWell(
                onTap: () {
                  selectedTheme(i);
                  print("clicked ${themeColors[i]}");                                    
                },
                child: Container(
                    margin: const EdgeInsets.all(5),
                    child: Ink(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
