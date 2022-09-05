import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:notes/utility/utility.dart';

class ThemeChanger with ChangeNotifier, DiagnosticableTreeMixin {
  List<ThemeData> avaiableThemes = availableThemes;
  int currentThemeIndex = 0;
  ThemeData get theme => avaiableThemes[currentThemeIndex];
  ThemeChanger() {
    setCurrentTheme();
  }
  void setCurrentTheme() async {
    currentThemeIndex = await getCurrentTheme();
    if (currentThemeIndex >= availableThemes.length) {
      currentThemeIndex = 0;
    }
  }

  void setTheme(index) {
    currentThemeIndex = index;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('currentThemeIndex', currentThemeIndex));
  }
}
