import 'package:flutter/material.dart';

class ColorConstants {
  static ColorConstants? _instance;
  static ColorConstants get instance {
    _instance ??= ColorConstants._init();
    return _instance!;
  }

  ColorConstants._init();

  //Color mainColor = Color(0xFF0F172A);
  //Color mainColor = Color(0xffFF9900);
  Color bermuda = Color(0xff6EDBC9);
  Color textColor = Color(0xFF252525);
  Color mainColor = Color(0xff55C2FF);
}
