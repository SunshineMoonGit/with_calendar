import 'package:flutter/material.dart';
import 'package:with_calendar/common/data/color_data.dart';

TextStyle _textStyle = const TextStyle(color: Colors.white);
ThemeData themeData() {
  return ThemeData(
    colorScheme: ThemeData().colorScheme.copyWith(
          secondary: ColorStyles.color_1,
        ),
    //* Font Style
    fontFamily: 'NotoSans',

    //* Scaffold Style
    scaffoldBackgroundColor: ColorStyles.color_5,

    //* Text Style
    textTheme: TextTheme(
      bodyLarge: _textStyle,
      bodyMedium: _textStyle,
      bodySmall: _textStyle,
      //*Text Field - TextStyle
      titleMedium: _textStyle,
    ),
    //* Icon Style
    iconTheme: const IconThemeData(color: ColorStyles.color_1),

    //* BottomNavigationBar Style
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: ColorStyles.color_6,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(color: ColorStyles.color_1, fill: 0),
      selectedIconTheme: IconThemeData(
        color: ColorStyles.color_1,
        fill: 1,
      ),
      // enableFeedback: false,
    ),

    //* FloatingActionButton Style
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorStyles.color_1,
      foregroundColor: ColorStyles.color_5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    ),

    //* AppBar Style
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorStyles.color_5,
      elevation: 0,
    ),

    //* TextField Style
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: _textStyle,
      border: InputBorder.none,
      hintStyle: TextStyle(color: ColorStyles.color_3.withOpacity(0.5)),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorStyles.color_3.withOpacity(0.5),
    ),
  );
}
