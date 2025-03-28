import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/models/task.dart';
import 'package:flutter_jr_hackathon/task/task_floating_action_button.dart';
import 'package:flutter_jr_hackathon/task/task_list_widget.dart';
import 'package:flutter_jr_hackathon/task/task_view_model.dart';
import 'package:flutter_jr_hackathon/widget/account_notifier.dart';
import 'package:flutter_jr_hackathon/widget/appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class TaskPage extends ConsumerWidget {
  const TaskPage({
    super.key,
  });

  String getWeekRange() {
    DateTime now = DateTime.now();
    int currentWeekday = now.weekday;

    DateTime monday = now.subtract(Duration(days: currentWeekday - 1));
    DateTime sunday = now.add(Duration(days: 7 - currentWeekday));

    String formattedMonday = DateFormat('MM/dd').format(monday);
    String formattedSunday = DateFormat('MM/dd').format(sunday);

    return '$formattedMonday - $formattedSunday';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Task> taskList = ref.watch(tasksProvider).when(
      data: (data) {
        List<Task> tasks = data.docs.map((e) => Task.fromJson(e.data())).toList();

        // createdAt で降順ソート (新しい順)
        tasks.sort((a, b) => b.createdAt.compareTo(a.createdAt));

        // createdAt で昇順ソート (古い順)
        // tasks.sort((a, b) => a.createdAt.compareTo(b.createdAt));

        return tasks;
      },
      error: (error, _) {
        return [];
      },
      loading: () {
        return [];
      },
    );

    print('---taskList---');
    print(taskList);

    final account = ref.watch(accountManagementProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Gap(20),
              Text(
                '今週（${getWeekRange()}）のタスク',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(20),
              // Expanded(
              //   child: ListView(
              //     children: [
              //       for (final task in taskList) ...{
              //         const TaskListWidget(),
              //       }
              //     ],
              //   ),
              // )

              // ListView.builder(
              //   itemCount: taskList.length ?? 0,
              //   shrinkWrap: true,
              //   itemBuilder: (context, index) {
              //     final task = taskList[index];
              //     return TaskListWidget(task: task);
              //   }
              // )
              for(final task in taskList) ...[
                TaskListWidget(task: task, thisWeek: getWeekRange(),),
              ]
            ],
          ),
        ),
      ),
      // drawer: const SideMenu(),
      appBar: MyAppBar(
        account: account,
      ),
      floatingActionButton: const TaskFloatingActionButton(),
    );
  }
}
