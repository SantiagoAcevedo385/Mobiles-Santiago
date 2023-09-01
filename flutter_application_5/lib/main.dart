import 'package:flutter/material.dart';
import 'package:flutter_application_2/screen_views/home_screen.dart';
import 'package:flutter_application_2/screen_views/list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyList()
    );
    
  }
}

