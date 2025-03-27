import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/task/task_floating_action_button.dart';
import 'package:flutter_jr_hackathon/task/task_list_widget.dart';
import 'package:flutter_jr_hackathon/widget/account_notifier.dart';
import 'package:flutter_jr_hackathon/widget/appbar.dart';
import 'package:flutter_jr_hackathon/widget/side_menu.dart';
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
    final account = ref.watch(accountManagementProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Gap(20),
              Text(
                getWeekRange(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(20),
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) => const TaskListWidget(),
              )
            ],
          ),
        ),
      ),
      drawer: const SideMenu(),
      appBar: MyAppBar(
        account: account,
      ),
      floatingActionButton: const TaskFloatingActionButton(),
    );
  }
}