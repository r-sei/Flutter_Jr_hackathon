import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/models/task.dart';
import 'package:flutter_jr_hackathon/task/task_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateTaskButton extends ConsumerWidget {
  const CreateTaskButton(
    this.task, {
    super.key,
  });

  final Task? task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        final penaltyTitle = ref.read(penaltyControllerProvider(task)).text;
        final taskTitle = ref.read(titleControllerProvider(task)).text;

        await ref
            .read(taskEditProvider.notifier)
            .create(taskTitle, penaltyTitle);

        ref.read(titleControllerProvider(task)).clear();
        ref.read(penaltyControllerProvider(task)).clear();
        Navigator.of(context).pop();
      },
      child: const Text('設定する!'),
    );
  }
}
