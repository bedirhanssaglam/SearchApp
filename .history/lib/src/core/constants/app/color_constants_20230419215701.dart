import 'package:flutter/material.dart';

class ColorConstants {
  static ColorConstants? _instance;
  static ColorConstants get instance {
    _instance ??= ColorConstants._init();
    return _instance!;
  }

  ColorConstants._init();

  Color mainColor = Color(0xFF0F172A);
  Color textColor = Color(0xFF252525);
  Color lightBlack = Color(0xFF3A3A3C);
}
