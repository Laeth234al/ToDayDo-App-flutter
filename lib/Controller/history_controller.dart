import 'dart:convert';
import 'package:ToDayDo/Models/task.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryController extends GetxController {
  List<Task> history = [];

  @override
  void onInit() async {
    super.onInit();
    final prefs = await SharedPreferences.getInstance();
    final String tasksJson = prefs.getString('tasks-history') ?? '';
    print(tasksJson);
    final List<Map<String, dynamic>> tasksMap;
    if (tasksJson != '') {
      // Convert the tasksJson string to a List<dynamic>
      final tasksList = jsonDecode(tasksJson) as List;
      // Cast the tasksList to a List<Map<String, dynamic>>
      tasksMap = tasksList.cast<Map<String, dynamic>>();
      // Create a list of Task objects from tasksMap
      history = tasksMap.map((taskMap) => Task.fromJson(taskMap)).toList();
    } else {
      // Create an empty list of tasks
      history = [];
    }
    update();
  }

  @override
  void onClose() async {
    super.onClose();
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = history.map((task) => task.toJson()).toList();
    await prefs.setString('tasks-history', jsonEncode(tasksJson));
  }

  void saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('tasks-history');
    final tasksJson = history.map((task) => task.toJson()).toList();
    await prefs.setString('tasks-history', jsonEncode(tasksJson));
  }

  void deleteAllHistory() {
    history.clear();
    update();
  }

  void addToHistory(Task task) {
    history.add(task);
    update();
    print('lenght : ${history.length}');
    print(history);
  }

  void removeTaskFromHistory(int index) {
    history.remove(history[index]);
    update();
  }
}
