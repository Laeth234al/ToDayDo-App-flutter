import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todaydo_app/Controller/history_controller.dart';
import 'package:todaydo_app/helper/colors_helper.dart';
import 'package:todaydo_app/helper/padding_helper.dart';
import 'package:todaydo_app/helper/textstyle_helper.dart';
import 'package:todaydo_app/widget/empty_info.dart';

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
            const Row(
              children: [
                Icon(
                  Icons.playlist_add_check,
                  size: 40.0,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
                Text(
                  'History',
                  style: HelperTextStyle.appBarTextStyle,
                )
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
                                title: Text(historyController.history[index].name),
                                subtitle: Text(
                                  '${DateFormat.yMd().add_jm().format(historyController.history[index].startDate)}\n${DateFormat.yMd().add_jm().format(historyController.history[index].exDate)}',
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
