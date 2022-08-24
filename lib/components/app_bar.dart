import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/pages/settings.dart';
import 'package:notes/utility/color_pallet.dart';
import 'package:notes/utility/page_transition.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: blurple, statusBarBrightness: Brightness.dark),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(pageTransition(
                      destination: const SettingsPage(),
                      direction: TransitionDirection.UP_TO_DOWN));
                },
                icon: const Icon(Icons.settings))
          ],
          title: const Text("📝", style: TextStyle(fontSize: 40)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 15);
}
