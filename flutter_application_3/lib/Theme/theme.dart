import 'package:flutter/material.dart';

class AppTheme{
  static const Color primary = Colors.blueAccent;
  static const Color secundary = Colors.yellow;
  static final ThemeData darkTheme = ThemeData.light().copyWith(
    primaryColor: Colors.greenAccent,
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 10,
    ),
  textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
  
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.orange),
    floatingLabelStyle: TextStyle(
      color: primary),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),
        topRight: Radius.circular(200))
        
      )
    )
  );
}