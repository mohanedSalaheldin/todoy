import 'package:flutter/material.dart';
import 'package:todo_with_firebase_08oct/layout/home_layout.dart';
import 'package:todo_with_firebase_08oct/shered/styles/themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(),
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}
