import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notes/pages/home.dart';
import 'package:notes/utility/color_pallet.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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