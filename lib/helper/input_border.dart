import 'package:flutter/material.dart';
import 'package:todaydo_app/helper/colors_helper.dart';

class HelperInputBorder {
  static InputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(width: 2.0, color: HelperColor.indigo),
  );
}
