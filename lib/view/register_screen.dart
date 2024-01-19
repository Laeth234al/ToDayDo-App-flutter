import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todaydo_app/Controller/auth_controller.dart';
import 'package:todaydo_app/helper/colors_helper.dart';
import 'package:todaydo_app/view/sign_in_screen.dart';
import 'package:todaydo_app/widget/sign_textfield.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // 50% size.height
          Container(
            height: size.height * 0.5,
            decoration: BoxDecoration(
              color: HelperColor.background,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(size.width * 0.25),
                bottomRight: Radius.circular(size.width * 0.25),
              ),
            ),
          ),
          // title
          SizedBox(
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.20,
                ),
                const Text(
                  'ToDayDo',
                  style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Register',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          // Form
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            width: size.width,
            child: ListView(
              children: [
                SizedBox(height: size.height * 0.45),
                SignTextFormField(
                  isPasswordTextField: false,
                  prefixIcon: Icons.person_4_outlined,
                  hintText: 'User Name',
                  labelText: 'User',
                  controller: authController.user,
                ),
                SizedBox(height: size.height * 0.025),
                SignTextFormField(
                  isPasswordTextField: false,
                  prefixIcon: Icons.email_outlined,
                  hintText: 'Email@example.com',
                  labelText: 'Email',
                  controller: authController.email,
                ),
                SizedBox(height: size.height * 0.025),
                SignTextFormField(
                  isPasswordTextField: true,
                  prefixIcon: Icons.lock_outline,
                  hintText: '********',
                  labelText: 'Password',
                  controller: authController.password,
                ),
                SizedBox(height: size.height * 0.025),
                ElevatedButton(
                  onPressed: () {
                    print(authController.isVaildForRegister ? "OKKK" : "NOOOOOOOOOOOOOOOOOOOO");
                    authController.isVaildForRegister ? Get.off(() => SignInScreen()) : null;
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(HelperColor.background)),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                // you already have an account. Sign in
                Text.rich(
                  TextSpan(
                    text: 'you already have an account. ',
                    children: [
                      WidgetSpan(
                        child: InkWell(
                          child: const Text(
                            'Sign in',
                            style: TextStyle(color: Colors.blue),
                          ),
                          onTap: () {
                            Get.off(() => SignInScreen());
                          },
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
