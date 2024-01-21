import 'package:ToDayDo/Controller/history_controller.dart';
import 'package:ToDayDo/Controller/tasks_controller.dart';
import 'package:ToDayDo/helper/colors_helper.dart';
import 'package:ToDayDo/helper/padding_helper.dart';
import 'package:ToDayDo/helper/textstyle_helper.dart';
import 'package:ToDayDo/view/add_task_screen.dart';
import 'package:ToDayDo/view/history_screen.dart';
import 'package:ToDayDo/widget/empty_info.dart';
import 'package:ToDayDo/widget/tasks_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});
  final v = Get.put(TasksController());
  final v1 = Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                child: const AddTasksScreen(),
              ),
            ),
          );
        },
        backgroundColor: HelperColor.indigo,
        child: const Icon(Icons.add),
      ),
      backgroundColor: HelperColor.background,
      body: Padding(
        padding: HelperPadding.paddingScaffold,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.playlist_add_check,
                  size: 40.0,
                  color: Colors.white,
                ),
                const Text(
                  'ToDayDo',
                  style: HelperTextStyle.appBarTextStyle,
                ),
                IconButton(
                  onPressed: () {
                    Get.to(() => History());
                  },
                  icon: const Icon(
                    Icons.history,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            GetBuilder<TasksController>(
              builder: (tasksController) => Text(
                '${tasksController.tasks.length} Tasks',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                padding: HelperPadding.paddingListViewSper,
                child: GetBuilder<TasksController>(
                  builder: (tasksController) => tasksController.tasks.isEmpty ? const EmptyInfo(text: 'There is no tasks for today') : TasksList(tasksController: tasksController),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
