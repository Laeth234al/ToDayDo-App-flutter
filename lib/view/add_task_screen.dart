import 'dart:math';
import 'package:ToDayDo/Controller/tasks_controller.dart';
import 'package:ToDayDo/helper/colors_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTasksScreen extends StatelessWidget {
  const AddTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = "";
    return Container(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add Task',
            style: TextStyle(
              fontSize: 30.0,
              color: HelperColor.indigo,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newValue) {
              newTaskTitle = newValue;
            },
          ),
          const SizedBox(height: 30.0),
          GetBuilder<TasksController>(
            builder: (controller) => TextButton(
              onPressed: () {
                controller.addTask(newTaskTitle, Random().nextInt(1000).toString());
                Get.back();
              },
              style: TextButton.styleFrom(
                backgroundColor: HelperColor.background,
                foregroundColor: Colors.white,
              ),
              child: const Text('Add'),
            ),
          ),
        ],
      ),
    );
  }
}
