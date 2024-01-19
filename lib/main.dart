import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todaydo_app/Controller/history_controller.dart';
import 'package:todaydo_app/Controller/tasks_controller.dart';
import 'package:todaydo_app/view/sign_in_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// Future<SharedPreferences>? sharedPres;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // sharedPres = SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
