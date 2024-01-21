import 'dart:convert';
import 'package:ToDayDo/Controller/history_controller.dart';
import 'package:ToDayDo/Models/task.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasksController extends GetxController {
  List<Task> tasks = [];
  @override
  void onInit() async {
    super.onInit();
    final prefs = await SharedPreferences.getInstance();
    final String tasksJson = prefs.getString('tasks') ?? '';
    print(tasksJson);
    final List<Map<String, dynamic>> tasksMap;
    if (tasksJson != '') {
      // Convert the tasksJson string to a List<dynamic>
      final tasksList = jsonDecode(tasksJson) as List;
      // Cast the tasksList to a List<Map<String, dynamic>>
      tasksMap = tasksList.cast<Map<String, dynamic>>();
      // Create a list of Task objects from tasksMap
      tasks = tasksMap.map((taskMap) => Task.fromJson(taskMap)).toList();
    } else {
      // Create an empty list of tasks
      tasks = [];
    }
    update();
  }

  @override
  void onClose() async {
    super.onClose();
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = tasks.map((task) => task.toJson()).toList();
    await prefs.setString('tasks', jsonEncode(tasksJson));
  }

  void saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('tasks');
    final tasksJson = tasks.map((task) => task.toJson()).toList();
    await prefs.setString('tasks', jsonEncode(tasksJson));
  }

  void addTask(String newTaskTitle, String newId) {
    tasks.add(Task(
      name: newTaskTitle,
      id: newId,
      startDate: DateTime.now(),
      exDate: DateTime.now(),
    ));
    update();
  }

  void toggleCheckbox(int index) {
    tasks[index].isDone = !tasks[index].isDone;
    update([index]);
  }

  void removeTask(Task task) {
    task.exDate = DateTime.now();
    Get.find<HistoryController>().addToHistory(task);
    print(task.exDate.toString());
    tasks.remove(task);
    update();
  }
}
