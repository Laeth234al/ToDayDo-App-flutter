import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todaydo_app/Controller/validator/form_validator.dart';

class AuthController extends GetxController {
  final TextEditingController user = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final formValidator = FormValidator();

  bool get isVaildForSignIn => formValidator.isValidEmail(email.text) && formValidator.isValidPassword(password.text);

  bool get isVaildForRegister => isVaildForSignIn && formValidator.isValidUserName(user.text);

  void signIn() {
    // sign in code
  }

  void signUp() {
    // sign up code
  }
}
