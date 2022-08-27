import 'package:flutter/material.dart';

class MyInputTextFeild extends Container {
  final String field;
  final TextEditingController controller;
  final int minLines;
  final int maxLines;  
  MyInputTextFeild({
    Key? key,
    required this.field,
    required this.controller,    
    this.minLines = 1,
    this.maxLines = 1,    
  }) : super(
          key: key,
          padding: const EdgeInsets.only(top: 20),
          child: Builder(
            builder: (context) {
              return TextFormField(
                style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                minLines: minLines,
                maxLines: maxLines,
                cursorColor: Theme.of(context).colorScheme.onBackground,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '$field cannot be empty';
                  }
                  return null;
                },
                controller: controller,
                decoration: inputFieldDecor(field, context),
              );
            }
          ),
        );
}

inputFieldDecor(label, context) {
  var focused = const OutlineInputBorder(    
    borderSide: BorderSide(            
      width: 3,
    ),
  );
  var labelStyle = TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.onBackground);
  return InputDecoration(    
    labelText: label,
    labelStyle: labelStyle,
    floatingLabelStyle: labelStyle,
    focusedErrorBorder: focused,
    focusedBorder: focused,    
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 3, color: Colors.red),
    ),       
    enabledBorder: OutlineInputBorder(            
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onBackground,
        width: 3,
      ),      
    ),
  );
}
