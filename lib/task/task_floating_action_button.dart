import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/sheet/task_sheet.dart';
import 'package:flutter_jr_hackathon/style/color.dart';

class TaskFloatingActionButton extends StatelessWidget {
  const TaskFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: col['accent1'],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      onPressed: () => showModalBottomSheet(
          isScrollControlled: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          context: context,
          builder: (context) => AddNewTask()),
      child: Icon(Icons.add, color: col['text1']),
    );
  }
}
