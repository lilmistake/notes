import 'package:flutter/material.dart';

const Color blurple = Color(0xff7289da);
const Color lightblack = Color(0xff191919);

List<ThemeData> availableThemes = <ThemeData>[
   ThemeData(
    fontFamily: 'ubuntu',
        colorScheme: const ColorScheme.light(
            primary: Colors.white,
            secondary: Colors.red,
            onPrimary: Colors.black,
            background: Color.fromARGB(255, 255, 213, 213),
            onBackground: Colors.black,
            onSecondary: Colors.white)),
    ThemeData(
      fontFamily: 'ubuntu',
        colorScheme: const ColorScheme.light(
            primary: Colors.white,
            secondary: Colors.black,
            onPrimary: Colors.black,
            background: Color(0xff121212),
            onBackground: Colors.white,
            onSecondary: Colors.white)),
    ThemeData(
      fontFamily: 'ubuntu',
        colorScheme: const ColorScheme.light(
            primary: Colors.white,
            secondary: Colors.grey,
            onPrimary: Colors.black,
            background: Colors.white,
            onBackground: Colors.black,
            onSecondary: Colors.black)),
];
