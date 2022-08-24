import 'package:flutter/material.dart';
import 'package:notes/utility/color_pallet.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        
        title: const Text("Settings"),
      ),
      
    );
  }
}
