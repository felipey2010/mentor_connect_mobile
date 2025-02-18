import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
      colorScheme: const ColorScheme(
        primary: Color.fromARGB(255, 214, 104, 0),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xffffe084),
        onPrimaryContainer: Color(0xff231b00),
        secondary: Color(0xff9c4331),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color.fromARGB(255, 245, 169, 98),
        onSecondaryContainer: Color(0xff3e0500),
        tertiary: Color.fromARGB(255, 238, 238, 238),
        onTertiary: Color(0xffffffff),
        tertiaryContainer: Color(0xffffdea4),
        onTertiaryContainer: Color(0xff261900),
        error: Color(0xffba1a1a),
        onError: Color(0xffffffff),
        errorContainer: Color(0xffffdad6),
        onErrorContainer: Color(0xff410002),
        surface: Color(0xfffffbff),
        onSurface: Color(0xff251a00),
        outline: Color(0xff7d7667),
        surfaceContainerHighest: Color(0xffebe2cf),
        onSurfaceVariant: Color(0xff4c4639),
        brightness: Brightness.light,
      ),
      useMaterial3: true,
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xff735c00),
        textTheme: ButtonTextTheme.primary,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 248, 242, 242),
        elevation: 8.0,
        enableFeedback: true,
      ));

  static ThemeData darkTheme = ThemeData(
      colorScheme: const ColorScheme(
          primary: Color.fromARGB(255, 248, 185, 11),
          onPrimary: Color(0xff3c2f00),
          primaryContainer: Color(0xff574500),
          onPrimaryContainer: Color(0xffffe084),
          secondary: Color(0xffffb4a5),
          onSecondary: Color(0xff5e1608),
          secondaryContainer: Color.fromARGB(255, 223, 164, 3),
          onSecondaryContainer: Color(0xffffdad3),
          tertiary: Color.fromARGB(255, 39, 39, 39),
          onTertiary: Color(0xff412d00),
          tertiaryContainer: Color(0xff5d4200),
          onTertiaryContainer: Color(0xffffdea4),
          error: Color(0xffffb4ab),
          onError: Color(0xff690005),
          errorContainer: Color(0xff93000a),
          onErrorContainer: Color(0xffffdad6),
          surface: Color.fromARGB(255, 19, 19, 19),
          onSurface: Color(0xffffdf9c),
          outline: Color(0xff979080),
          surfaceContainerHighest: Color(0xff4c4639),
          onSurfaceVariant: Color(0xffcec6b4),
          brightness: Brightness.dark),
      useMaterial3: true,
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xffe8c349),
        textTheme: ButtonTextTheme.primary,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(211, 15, 15, 15),
        elevation: 8.0,
        enableFeedback: true,
      ));
}
