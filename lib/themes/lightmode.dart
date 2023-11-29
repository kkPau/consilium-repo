import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w700,
        color: Colors.grey[400],
      ),
      backgroundColor: Colors.grey[900],
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 25,
        // fontWeight: FontWeight.w900,
      ),
      titleSmall: TextStyle(
          fontFamily: 'OpenSans', fontSize: 20, fontWeight: FontWeight.bold),
      bodySmall: TextStyle(
        fontFamily: 'Quicksand',
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Quicksand',
        fontSize: 20,
        fontWeight: FontWeight.w900,
      ),
      bodyLarge: TextStyle(
        decoration: TextDecoration.underline,
        fontFamily: 'Quicksand',
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
      labelMedium: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade200,
      primary: Colors.white,
      secondary: Colors.black,
    ));
