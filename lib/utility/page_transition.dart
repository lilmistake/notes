import 'package:flutter/material.dart';

class TransitionDirection {
  static Offset UP_TO_DOWN = const Offset(0.0, -1.0);
  static Offset DOWN_TO_UP = const Offset(0.0, 1.0);
  static Offset LEFT_TO_RIGHT = const Offset(-1.0, 0.0);
  static Offset RIGHT_TO_LEFT = const Offset(1.0, 0.0);
}

pageTransition({destination, direction}) {  
  return PageRouteBuilder(
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        Offset begin = direction;
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      pageBuilder: ((context, animation, secondaryAnimation) => destination));
}
