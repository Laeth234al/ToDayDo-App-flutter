import 'package:flutter/material.dart';

class HelperTextStyle {
  static const TextStyle appBarTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
    shadows: [
      BoxShadow(
        color: Colors.black,
        offset: Offset(0, 4),
        blurRadius: 10,
      ),
    ],
  );
}
