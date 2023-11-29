import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w700,
      color: Colors.white.withOpacity(0.6),
    ),
    backgroundColor: Colors.grey.shade900,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 25,
      fontWeight: FontWeight.w900,
    ),
    titleSmall: TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 20,
      fontWeight: FontWeight.bold
    ),
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
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
      labelMedium: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
  ),
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade900,
    primary: Colors.black,
    secondary: Colors.white,
    
  )
);