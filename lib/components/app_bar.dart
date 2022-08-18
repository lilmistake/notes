import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/utility/color_pallet.dart';
class MyAppBar extends StatelessWidget with PreferredSizeWidget{
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: blurple,
          statusBarBrightness: Brightness.dark),
      backgroundColor: blurple,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      title: const Text("📝 NOTES"),
    );
  }
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
