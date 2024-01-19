import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todaydo_app/Controller/password_controller.dart';
import 'package:todaydo_app/helper/colors_helper.dart';
import 'package:todaydo_app/helper/input_border.dart';

class SignTextFormField extends StatelessWidget {
  SignTextFormField({
    super.key,
    required this.isPasswordTextField,
    required this.hintText,
    required this.labelText,
    required this.prefixIcon,
    required this.controller,
  });
  final TextEditingController controller;
  final bool isPasswordTextField;
  final String hintText;
  final String labelText;
  final IconData prefixIcon;
  final cont = Get.lazyPut(() => PasswordController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasswordController>(
      builder: (hiddingController) => TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: HelperInputBorder.inputBorder,
          focusedBorder: HelperInputBorder.inputBorder,
          enabledBorder: HelperInputBorder.inputBorder,
          prefixIcon: Icon(
            prefixIcon,
            color: HelperColor.indigo,
          ),
          suffixIcon: isPasswordTextField
              ? InkWell(
                  onTap: () {
                    hiddingController.toggleMode();
                  },
                  child: Icon(hiddingController.isPasswordHidding ? Icons.visibility : Icons.visibility_off),
                )
              : null,
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          labelText: labelText,
        ),
        obscureText: isPasswordTextField ? hiddingController.isPasswordHidding : false, // password
      ),
    );
  }
}
