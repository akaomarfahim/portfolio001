import 'package:flutter/material.dart';

class Screen {
  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static brightness(BuildContext context) {
    return MediaQuery.of(context).platformBrightness;
  }

  static isDark(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }

  static textScaleFactor(BuildContext context) {
    return MediaQuery.of(context).textScaleFactor;
  }
}
