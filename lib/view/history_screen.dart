import 'package:ToDayDo/Controller/history_controller.dart';
import 'package:ToDayDo/helper/colors_helper.dart';
import 'package:ToDayDo/helper/padding_helper.dart';
import 'package:ToDayDo/helper/textstyle_helper.dart';
import 'package:ToDayDo/widget/empty_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class History extends StatelessWidget {
  History({super.key});
  final v = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HelperColor.background,
      body: Container(
        padding: HelperPadding.paddingScaffold,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  'History',
                  style: HelperTextStyle.appBarTextStyle,
                ),
                GetBuilder<HistoryController>(
                  builder: (historyController) => IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: HelperColor.background, // Using your background color
                            title: const Text(
                              'Delete All History',
                              style: TextStyle(color: HelperColor.indigo, fontWeight: FontWeight.bold), // Using your indigo color
                            ),
                            content: const Text(
                              'Are you sure you want to delete all history?',
                              style: TextStyle(color: HelperColor.listTile), // Using your listTile color
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () => Get.back(), // Close dialog without deletion
                                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(HelperColor.indigo)),
                                child: const Text('Cancel', style: TextStyle(color: Colors.white)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  historyController.deleteAllHistory();
                                  Get.back(); // Close dialog and indicate deletion
                                },
                                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),
                                child: const Text('Delete', style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      CupertinoIcons.trash,
                      color: Colors.red,
                      size: 30.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                padding: HelperPadding.paddingListViewSper,
                child: GetBuilder<HistoryController>(
                  builder: (historyController) => historyController.history.isEmpty
                      ? const EmptyInfo(text: 'There is no data in history')
                      : ListView.separated(
                          itemCount: historyController.history.length,
                          // This is for white space on the top of ListView Builder
                          padding: EdgeInsets.zero,
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 4.0);
                          },
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: HelperColor.listTile,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ListTile(
                                title: Text(
                                  historyController.history[index].name,
                                  style: HelperTextStyle.titleTextStyle,
                                ),
                                subtitle: Text(
                                  'Start date : ${DateFormat.yMd().add_jm().format(historyController.history[index].startDate)}\nEnd date : ${DateFormat.yMd().add_jm().format(historyController.history[index].exDate)}',
                                  style: HelperTextStyle.subtitleTextStyle,
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    historyController.removeTaskFromHistory(index);
                                  },
                                  icon: const Icon(CupertinoIcons.trash),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
