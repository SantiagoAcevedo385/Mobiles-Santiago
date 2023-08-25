import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screen_View/form.dart';
import 'package:flutter_application_3/Screen_View/lista.dart';
import 'package:flutter_application_3/Screen_View/rutinas.dart';
import 'package:flutter_application_3/Theme/theme.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MyList()
    );
  }
}
