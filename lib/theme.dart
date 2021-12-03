import 'package:flutter/material.dart';

ThemeData appTheme() { 
    return ThemeData(
        fontFamily: 'Atyp',
        primaryColor: const Color(0xFFFF614E),
        primaryColorDark: const Color(0xFFEF3929),
        textTheme: const TextTheme(
            headline1: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 28,
                color: Colors.white,
            ),
            headline2: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 24,
                color: Colors.black87,
            ),
        ),
    );
}