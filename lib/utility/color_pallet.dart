import 'package:flutter/material.dart';

const Color blurple = Color(0xff7289da);
const Color lightblack = Color(0xff191919);

List<ThemeData> availableThemes = <ThemeData>[
   ThemeData(
        colorScheme: const ColorScheme.light(
            primary: Colors.white,
            secondary: Colors.red,
            onPrimary: Colors.black,
            background: Colors.white,
            onSecondary: Colors.white)),
    ThemeData(
        colorScheme: const ColorScheme.light(
            primary: Colors.white,
            secondary: Colors.black,
            onPrimary: Colors.black,
            background: Colors.white,
            onSecondary: Colors.white)),
    ThemeData(
        colorScheme: const ColorScheme.light(
            primary: Colors.white,
            secondary: Colors.blue,
            onPrimary: Colors.black,
            background: Colors.white,
            onSecondary: Colors.black))
];
