
import 'package:flutter/material.dart';

class AppUiConfig {
  AppUiConfig._();

  static String get title => 'Filmes App';

  static ThemeData get theme => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      toolbarTextStyle: TextStyle(
        color: Color(0xFF222222),
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ), 
    ),
  );

}