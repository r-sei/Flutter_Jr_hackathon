import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileIconButton extends ConsumerWidget {
  const ProfileIconButton({
    super.key,
    required this.color,
    this.onPressed,
  });

  final Color color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      icon: CircleAvatar(
        backgroundColor: color,
        radius: 16,
        child: Icon(
          Icons.person,
          color: Colors.grey.shade100,
        ),
      ),
    );
  }
}
