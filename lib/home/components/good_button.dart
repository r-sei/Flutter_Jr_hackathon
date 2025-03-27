import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/home/home_view_model.dart';
import 'package:flutter_jr_hackathon/models/progress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoodButton extends ConsumerWidget {
  const GoodButton({
    super.key,
    required this.progress,
  });

  final Progress progress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isGood = progress.likes.contains(progress.userName);

    return IconButton(
      icon: Icon(
        isGood ? Icons.favorite : Icons.favorite_border,
        color: isGood ? Colors.red : Colors.grey,
      ),
      iconSize: 40,
      onPressed: () {
        if (progress.likes.contains(progress.userName)) {
          ref.read(likesNotifierProvider.notifier).delete(progress);
        } else {
          ref.read(likesNotifierProvider.notifier).add(progress);
        }
      },
    );
  }
}
