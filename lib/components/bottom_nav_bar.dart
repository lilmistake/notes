import 'package:flutter/material.dart';
import 'package:notes/utility/page_transition.dart';
import '../pages/pages.dart';

class MyBottomNavBar extends StatelessWidget {    
  const MyBottomNavBar({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Icon(
        Icons.add,
        size: 50,
      ),
      onPressed: () {
        
        Navigator.of(context).push(pageTransition(destination: const CreateNote(), direction: TransitionDirection.DOWN_TO_UP));
      },
    );
  }
}
