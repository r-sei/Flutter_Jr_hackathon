import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/auth/current_user_provider.dart';
import 'package:flutter_jr_hackathon/models/task.dart';
import 'package:flutter_jr_hackathon/style/color.dart';
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
    final currentUserName = ref.watch(userNameProvider).when(
      data: (data) {
        return data;
      },
      error: (err, _) {
        return '';
      },
      loading: () {
        return '';
      },
    );

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[300],
        shadowColor: Colors.grey[500],
        elevation: 0,
        minimumSize: const Size(100, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () async {
        final penaltyTitle = ref.read(penaltyControllerProvider(task)).text;
        final taskTitle = ref.read(titleControllerProvider(task)).text;

        await ref
            .read(taskEditProvider.notifier)
            .create(taskTitle, penaltyTitle, currentUserName!);

        ref.read(titleControllerProvider(task)).clear();
        ref.read(penaltyControllerProvider(task)).clear();
        Navigator.of(context).pop();
      },
      child: Text('設定する!',
          style: TextStyle(
              color: col['accent1'],
              fontWeight: FontWeight.bold,
              shadows: const [
                Shadow(
                  blurRadius: 4,
                  color: Colors.white,
                  offset: Offset(1.5, 1.5),
                ),
                Shadow(
                  blurRadius: 3,
                  color: Color.fromARGB(255, 181, 181, 181),
                  offset: Offset(-1.5, -1.5),
                ),
              ])),
    );
  }
}
