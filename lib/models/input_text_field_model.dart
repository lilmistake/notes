import 'package:flutter/material.dart';
import 'package:notes/utility/utility.dart';

class MyInputTextFeild extends Container {
  final String field;
  final TextEditingController controller;
  final int minLines;
  final int maxLines;
  MyInputTextFeild(
      {Key? key, required this.field,
      required this.controller,
      this.minLines = 1,
      this.maxLines = 1})
      : super(key: key, 
          padding: const EdgeInsets.only(top: 20),
          child: TextFormField(
            minLines: minLines,
            maxLines: maxLines,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '$field cannot be empty';
              }
              return null;
            },
            style: const TextStyle(color: Colors.white),
            controller: controller,
            cursorColor: Colors.white,
            decoration: inputFieldDecor(field),
          ),
        );
}


inputFieldDecor(label) {
  var focused = const OutlineInputBorder(
    borderSide: BorderSide(width: 3, color: Colors.white),
  );
  var labelStyle = const TextStyle(color: Colors.white, fontSize: 20);
  return InputDecoration(
    labelText: label,
    labelStyle: labelStyle,
    floatingLabelStyle: labelStyle,
    focusedErrorBorder: focused,
    focusedBorder: focused,
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 3, color: Colors.red),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 3, color: blurple),
    ),
  );
}