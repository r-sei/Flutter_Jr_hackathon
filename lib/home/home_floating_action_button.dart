import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/sheet/achivement_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeFloatingActionButton extends ConsumerWidget {
  const HomeFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () => showModalBottomSheet(
          isScrollControlled: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          context: context,
          builder: (context) => const AddNewAchivement()),
      child: const Icon(Icons.add),
    );
  }
}
