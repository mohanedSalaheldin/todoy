import 'package:flutter/material.dart';
import 'package:todo_with_firebase_08oct/shered/styles/colors.dart';

ThemeData lightTheme() => ThemeData(
    fontFamily: 'OneSans',
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20.0,
        fontFamily: 'OneSans',
        fontWeight: FontWeight.w600,
      ),
    ),
    // primarySwatch: defaultColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: defaultColor,
      secondary: defaultColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsetsDirectional.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      labelStyle: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
      iconColor: defaultColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsetsDirectional.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        labelStyle: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        iconColor: defaultColor,
      ),
    ),
    iconTheme: IconThemeData(color: defaultColor));
