import 'package:flutter/material.dart';

ThemeData lightTheme() => ThemeData(
      primarySwatch: Colors.brown,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
      ),
    );
