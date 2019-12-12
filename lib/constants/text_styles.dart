import 'package:flutter_web/material.dart';
import 'package:portfolio/constants/fonts.dart';

class TextStyles {
  TextStyles._();

  static TextStyle get logo => TextStyle(
        fontFamily: Fonts.product,
        color: Color(0xFF45405B),
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
      );

  static TextStyle get menu_item => TextStyle(
        fontFamily: Fonts.product,
        fontSize: 16.0,
        color: Color(0xFF45405B),
      );

  static TextStyle get heading => TextStyle(
        fontFamily: Fonts.nexa_bold,
        color: Color(0xFF45405B),
        fontSize: 45.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
      );

  static TextStyle get sub_heading => TextStyle(
        color: Colors.grey,
        fontFamily: 'Inconsolata',
        fontSize: 24.0,
        letterSpacing: 1.2,
      );

  static TextStyle get company => TextStyle(
    fontFamily: 'Inconsolata',
    color: Colors.grey[300],
        height: 1.5,
        fontSize: 24.0,
        //15.0
        letterSpacing: 1.0,
      );

  static TextStyle get body => TextStyle(
        fontFamily: 'Inconsolata',
        color: Colors.grey[300],
        height: 1.5,
        fontSize: 16.0,
        //12.0
        letterSpacing: 1.0,
      );

  static TextStyle get body1 => TextStyle(
        fontFamily: Fonts.product,
        color: Color(0xFF85819C),
        height: 1.5,
        fontSize: 10.0,
        //10.0
        letterSpacing: 1.0,
      );

  static TextStyle get chip => TextStyle(
        fontFamily: Fonts.product,
        height: 1.5,
        fontSize: 12.0, //12.0
        letterSpacing: 1.0,
      );
}
