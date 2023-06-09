import 'package:flutter/material.dart';

//Este tema no tiene mucho sentido xD. PERO NO SE HACER TEMAS. Así pues mirar de arreglar :(
class DarkTheme {

  static const Color ultraLightViolet = Color.fromRGBO(95, 2, 138, 1);
  static const Color lightViolet = Color.fromRGBO(161, 89, 222, 1);
  static const Color violet = Color.fromRGBO(138, 96, 226, 1);
  static const Color middleViolet =  Color.fromRGBO(110, 71, 193, 1);
  static const Color darkViolet =  Color.fromRGBO(46, 51, 90, 1);
  static const Color secondDarkViolet =  Color.fromRGBO(53, 38, 97, 1);
  static const Color ultradarkViolet =  Color.fromRGBO(28, 27, 51, 1);

  static const Color dark = Color.fromRGBO(31, 34, 60, 1);
    
  static const  Color grey1 = Color.fromRGBO(193, 193, 193, 1);
  static const  Color grey2 = Color.fromRGBO(231, 231, 231, 1);

    
    static Color gradientBackgroundColorTop = darkViolet;
    static Color gradientBackgroundColorDown = ultradarkViolet;


    static Color cardTimeTop = violet;
    static Color cardTimeMiddle = middleViolet;
    static Color cardTimeDown = darkViolet;
    

  final _darkTheme = ThemeData(
    useMaterial3: true,
    primaryColorDark:  darkViolet,

    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: Colors.white, fontSize: 35, height: 1),
      headlineMedium: TextStyle(color: grey1, fontSize: 20, height: 1),
      headlineSmall: TextStyle(color: lightViolet, fontSize: 20, height: 1),
      displayLarge: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold, height: 1, ),
      displayMedium: TextStyle(color: grey1, fontSize: 30, height: 1),
      bodyMedium: TextStyle(color: grey2),      
      bodyLarge: TextStyle(color: Colors.white, fontSize: 20, height: 1),     
    ),
    fontFamily: 'Inter',
    brightness: Brightness.dark,
    iconTheme: const IconThemeData(
      color: grey1,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    
    
    inputDecorationTheme: InputDecorationTheme(
      constraints: const BoxConstraints(
        minHeight: 45,
        maxHeight: 45
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(35),
        borderSide: const BorderSide(
          width: 1,
          color: grey1
        ),
      ),
      fillColor: secondDarkViolet,
      filled: true,
      iconColor: grey1,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: const TextStyle(
        color: grey1,
        fontSize: 22
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(35),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1
        )
      ),
      errorStyle: const TextStyle(
        color: Colors.red,
        height: 1
      ),
      errorMaxLines: 2,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 3
      )      
    )
  );

  ThemeData getTheme() {
    return _darkTheme;
  }
}