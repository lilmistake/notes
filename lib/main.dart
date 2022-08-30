import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notes/pages/home.dart';
import 'package:notes/utility/utility.dart';
import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeChanger()),
    ],
    child: const HomePage(),
  ));
}

class ThemeChanger with ChangeNotifier, DiagnosticableTreeMixin {
  List<ThemeData> avaiableThemes = availableThemes;
  int currentThemeIndex = 0;
  ThemeData get theme => avaiableThemes[currentThemeIndex];
  ThemeChanger() {
    setCurrentTheme();
  }
  void setCurrentTheme() async {
    currentThemeIndex = await getCurrentTheme();
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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}