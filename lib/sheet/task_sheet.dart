import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/models/task.dart';
import 'package:flutter_jr_hackathon/sheet/button/create_task_button.dart';
import 'package:flutter_jr_hackathon/task/task_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewTask extends ConsumerWidget {
  const AddNewTask({super.key, this.task});

  final Task? task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Text('今週のみんなのチャレンジ！',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 30),
          const Align(
              alignment: Alignment.centerLeft,
              child: Text('タスクを追加しよう！',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
          //const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.edit),
              const SizedBox(width: 16),
              Flexible(
                child: TextField(
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: '何をしたい?',
                  ),
                  controller: ref.watch(titleControllerProvider(task)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('ペナルティを設定しよう！',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          //const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.edit),
              const SizedBox(width: 16),
              Flexible(
                child: TextField(
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: '達成できなかったらどうする?',
                  ),
                  controller: ref.watch(penaltyControllerProvider(task)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          CreateTaskButton(task),
        ],
      ),
    );
  }
}
