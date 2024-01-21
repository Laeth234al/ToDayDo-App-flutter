import 'package:ToDayDo/helper/colors_helper.dart';
import 'package:flutter/material.dart';

class HelperInputBorder {
  static InputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(width: 2.0, color: HelperColor.indigo),
  );
}
