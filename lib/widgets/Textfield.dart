// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';


class MyTextfield extends StatelessWidget {

  final textController;
  final String hintText;
  final bool obscureText;
  final keytype;
  final icontype;

  MyTextfield({
    required this.textController,
    required this.hintText,
    required this.obscureText,
    required this.keytype,
    required this.icontype
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        cursorColor: Colors.black,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: keytype,
        obscureText: obscureText,
        controller: textController,
        decoration: InputDecoration(
          prefixIcon: icontype,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          fillColor: Colors.grey[300],
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}