import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/sheet/task_sheet.dart';

class TaskFloatingActionButton extends StatelessWidget {
  const TaskFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showModalBottomSheet(
          isScrollControlled: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          context: context,
          builder: (context) => const AddNewTask()),
      child: const Icon(Icons.add),
    );
  }
}
