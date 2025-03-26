import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/home/home_view_model.dart';
import 'package:flutter_jr_hackathon/models/progress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateAchieveButton extends ConsumerWidget {
  const CreateAchieveButton(
    this.progress,
    this.achieveLevel, {
    super.key,
  });

  final Progress? progress;
  final double achieveLevel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        final title = ref.read(ProgressControllerProvider(progress)).text;

        await ref
            .read(progressNotifierProvider.notifier)
            .create(title, achieveLevel);
        ref.read(ProgressControllerProvider(progress)).clear();
        Navigator.of(context).pop();
      },
      child: const Text('報告する!'),
    );
  }
}
