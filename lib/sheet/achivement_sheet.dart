import 'package:flutter/material.dart';
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
  const AddNewAchivement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskName = ref.watch(taskNameProvider);
    final valueSlider = ref.watch(sliderValueProvider);
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Text('進捗を報告しよう！',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 30),
          DropdownMenu(
            dropdownMenuEntries: task
                .map((task) => DropdownMenuEntry(value: task, label: task))
                .toList(),
            width: 500,
            label: Text("このタスク、進めました！"),
            helperText: "タスクを選択してください",
            onSelected: (value) => ref.read(taskNameProvider.notifier).update((state)=> value),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.directions_run),
              Container(
                width: 120,
                child: Text('進捗率${valueSlider}%', style: TextStyle(fontSize: 16),textAlign: TextAlign.right,),
              ),
              
              Expanded(
                child: Slider(
                  label: '${valueSlider}%',
                  min: 0,
                  max: 100,
                  /*activeColor: Colors.orange,
                  inactiveColor: Colors.blueAccent,*/
                  divisions: 4,
                  onChanged: (value) => ref.read(sliderValueProvider.notifier).update((state) => value),
                  value: valueSlider,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.comment),
              const SizedBox(width: 16),
              Flexible(
                child: TextField(
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: '何をした?',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('報告する!'),
          ),
        ],
      ),
    );
  }
}