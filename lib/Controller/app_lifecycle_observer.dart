import 'package:ToDayDo/Controller/history_controller.dart';
import 'package:ToDayDo/Controller/tasks_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLifecycleObserver extends GetxController with WidgetsBindingObserver {
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.inactive || state == AppLifecycleState.paused) {
      Get.find<TasksController>().saveData(); // Call saveData from task controller
      Get.find<HistoryController>().saveData(); // Call saveData from history controller
    }
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }
}
