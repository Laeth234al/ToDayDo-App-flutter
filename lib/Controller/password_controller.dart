import 'package:get/get.dart';

class PasswordController extends GetxController {
  bool isPasswordHidding = true;
  void toggleMode() {
    isPasswordHidding = !isPasswordHidding;
    update();
  }
}
