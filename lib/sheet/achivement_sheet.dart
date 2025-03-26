import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/home/home_view_model.dart';
import 'package:flutter_jr_hackathon/models/progress.dart';
import 'package:flutter_jr_hackathon/sheet/button/create_achieve_button.dart';
import 'package:flutter_jr_hackathon/sheet/slider_value_provider.dart';
import 'package:flutter_jr_hackathon/sheet/task_name_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// タスクのリストのモックデータ
final List<String> task = [
  'Task 1',
  'Task 2',
  'Task 3',
  'Task 4',
  'Task 5',
];

class AddNewAchivement extends ConsumerWidget {
  const AddNewAchivement({
    super.key,
    this.progress,
  });

  final Progress? progress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final valueSlider = ref.watch(sliderValueNotifierProvider);

    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Text('進捗を報告しよう！',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 30),
          DropdownMenu(
            dropdownMenuEntries: task
                .map((task) => DropdownMenuEntry(value: task, label: task))
                .toList(),
            width: 500,
            label: const Text("このタスク、進めました！"),
            helperText: "タスクを選択してください",
            onSelected: (value) =>
                ref.read(taskNameNotifierProvider.notifier).selectTask(value!),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.directions_run),
              SizedBox(
                width: 120,
                child: Text(
                  '進捗率$valueSlider%',
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.right,
                ),
              ),
              Expanded(
                child: Slider(
                  label: '$valueSlider%',
                  min: 0,
                  max: 100,
                  /*activeColor: Colors.orange,
                  inactiveColor: Colors.blueAccent,*/
                  divisions: 4,
                  onChanged: (value) => ref
                      .read(sliderValueNotifierProvider.notifier)
                      .update(value),
                  value: valueSlider,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.comment),
              const SizedBox(width: 16),
              Flexible(
                child: TextField(
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: '何をした?',
                  ),
                  controller: ref.watch(progressControllerProvider(progress)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          //   child: const Text('報告する!'),
          // ),
          CreateAchieveButton(progress, valueSlider),
        ],
      ),
    );
  }
}
