import 'package:ToDayDo/Controller/tasks_controller.dart';
import 'package:ToDayDo/helper/colors_helper.dart';
import 'package:ToDayDo/helper/textstyle_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.tasksController,
    required this.index,
  });
  final TasksController tasksController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HelperColor.listTile,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        onLongPress: () {
          tasksController.removeTask(tasksController.tasks[index]);
          tasksController.update();
        },
        title: Text(
          tasksController.tasks[index].name,
          style: HelperTextStyle.titleTextStyle.copyWith(
            decoration: tasksController.tasks[index].isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          DateFormat.yMd().add_jm().format(tasksController.tasks[index].startDate),
          style: HelperTextStyle.subtitleTextStyle,
        ),
        trailing: Checkbox(
          activeColor: HelperColor.background,
          value: tasksController.tasks[index].isDone,
          onChanged: (newVal) {
            tasksController.toggleCheckbox(index);
            tasksController.update();
          },
        ),
      ),
    );
  }
}
