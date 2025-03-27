import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/task/task_floating_action_button.dart';
import 'package:flutter_jr_hackathon/widget/appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskPage extends ConsumerWidget {
  const TaskPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: MyAppBar(),
      floatingActionButton: const TaskFloatingActionButton(),
    );
  }
}
