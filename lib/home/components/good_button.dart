import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final goodProvider = StateProvider<bool>((ref) => false);

class GoodButton extends ConsumerWidget {
  const GoodButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isGood = ref.watch(goodProvider);
    return IconButton(
      icon: Icon(
        isGood ? Icons.favorite : Icons.favorite_border,
        color: isGood ? Colors.red : Colors.grey,
      ),
      iconSize: 40,
      onPressed: () => ref.read(goodProvider.notifier).state = !isGood,
    );
  }
}
