import 'package:flutter/material.dart';

class BaseTextTheme {
  static const TextStyle boldFont = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      // color: Color(0xff0A0F0F),
      fontFamily: "Gilroy");

  static const TextStyle mediumFont = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      // color: Color(0xff0A0F0F),
      fontFamily: "Gilroy");
  static const TextStyle regularFont = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      // color: Color(0xff0A0F0F),
      fontFamily: "Gilroy");

  static const TextStyle titleFont = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, fontFamily: "Gilroy");
}

class CustomFontSizes {
  static const xSmall = 10.0;
  static const regularFont = 14.0;
  static const medium = 18.0;
  static const boldFont = 24.0;
  static const xLarge = 34.0;
}
