import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/home/home_view_model.dart';
import 'package:flutter_jr_hackathon/models/progress.dart';
import 'package:flutter_jr_hackathon/style/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateAchieveButton extends ConsumerWidget {
  const CreateAchieveButton(
    this.progress,
    this.achieveLevel,
    this.taskTitle, {
    super.key,
  });

  final Progress? progress;
  final double achieveLevel;
  final String taskTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        final progressTitle =
            ref.read(ProgressControllerProvider(progress)).text;

        await ref
            .read(progressNotifierProvider.notifier)
            .create(taskTitle, progressTitle, achieveLevel / 100);

        ref.read(ProgressControllerProvider(progress)).clear();
        Navigator.of(context).pop();
      },
      child: Text('報告する!',
          style: TextStyle(
              color: col['accent2'],
              fontWeight: FontWeight.bold,
              shadows: [
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
