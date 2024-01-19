import 'package:flutter/material.dart';
import 'package:todaydo_app/Controller/tasks_controller.dart';
import 'package:todaydo_app/widget/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasksController,
  });
  final TasksController tasksController;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: tasksController.tasks.length,
      padding: EdgeInsets.zero,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 4.0);
      },
      itemBuilder: (context, index) {
        return TaskTile(tasksController: tasksController, index: index);
      },
    );
  }
}
