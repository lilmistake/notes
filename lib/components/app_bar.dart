import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/utility/color_pallet.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: blurple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBar(
              backgroundColor: blurple,
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: blurple,
                  statusBarBrightness: Brightness.dark),
              foregroundColor: Colors.white,
              centerTitle: true,
              elevation: 0,
              title: const Text("📝", style: TextStyle(fontSize: 40)),
            ),
          ],
        ));
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 15);
}
