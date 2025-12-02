import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: Color(0xffEBEBEB),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xffEBEBEB),
      centerTitle: true,
      iconTheme: IconThemeData(color: Color(0xff212121)),
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Color(0xff1F1F1F),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:  Color(0xff212121),
        textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xffFFFFFF),
            ),
      )
    ),
    textTheme:  TextTheme(
      displayLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color(0xff1F1F1F),
      ),
    displayMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Color(0xff1F1F1F),
    ),
    displaySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xff1F1F1F),
    ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Color(0xff212121),
      unselectedItemColor: Color(0xff5C5C5C),
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      selectedLabelStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xff212121),
    ),
      unselectedLabelStyle:TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Color(0xff5C5C5C),
  ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.transparent,
      filled: true,
      hintStyle: TextStyle(
        fontSize: 16,
        // color: AppColor.gray,
        fontWeight: FontWeight.w500,
      ),
      errorStyle: const TextStyle(color: Colors.red),
      contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
      border: outlineInputBorder(color: Colors.grey, width: 1),
      enabledBorder: outlineInputBorder(color: Colors.grey, width: 1),
      focusedBorder: outlineInputBorder(color: Colors.black, width: 1),
      errorBorder: outlineInputBorder(color: Colors.red, width: 1),
      focusedErrorBorder: outlineInputBorder(color: Colors.red, width: 1),
    ),
  );
  static ThemeData dark = ThemeData();
}
OutlineInputBorder outlineInputBorder({required Color color, required double width}) {
  return OutlineInputBorder(
    borderRadius:  BorderRadius.circular(10),
    borderSide: BorderSide(color: color, width: width),
  );
}