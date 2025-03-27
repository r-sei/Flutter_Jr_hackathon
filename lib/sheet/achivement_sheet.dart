import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/home/home_view_model.dart';
import 'package:flutter_jr_hackathon/models/progress.dart';
import 'package:flutter_jr_hackathon/sheet/button/create_achieve_button.dart';
import 'package:flutter_jr_hackathon/sheet/slider_value_provider.dart';
import 'package:flutter_jr_hackathon/sheet/task_name_provider.dart';
import 'package:flutter_jr_hackathon/style/color.dart';
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
    final taskTitle = ref.watch(taskNameNotifierProvider);

    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Text('進捗を報告しよう！',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  /*shadows: [
                    Shadow(
                        blurRadius: 2,
                        color: Color.fromARGB(255, 92, 92, 92),
                        offset: Offset(1.5, 1.5)),
                    Shadow(
                        blurRadius: 2,
                        color: Colors.white,
                        offset: Offset(-1.5, -1.5))
                  ]*/)),
          const SizedBox(height: 30),
          Container(
            width: MediaQuery.of(context).size.width - 60,
            //height: 57,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[500]!,
                  blurRadius: 10,
                  offset: const Offset(5, 5),
                ),
                const BoxShadow(
                  color: Colors.white,
                  blurRadius: 15,
                  offset: Offset(-5, -5),
                ),
              ],
            ),
            child: DropdownMenu(
              dropdownMenuEntries: task
                  .map((task) => DropdownMenuEntry(value: task, label: task))
                  .toList(),
              width: MediaQuery.of(context).size.width - 100,
              label: const Text("このタスク、進めました！"),
              helperText: "タスクを選択してください",
              onSelected: (value) => ref
                  .read(taskNameNotifierProvider.notifier)
                  .selectTask(value!),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              const Stack(children: [
                Positioned(
                    left: 1.2,
                    top: 1.2,
                    child: Icon(
                      Icons.directions_run,
                      color: Color.fromARGB(255, 92, 92, 92),
                      size: 24,
                    )),
                Positioned(
                    left: -1.2,
                    top: -1.2,
                    child: Icon(
                      Icons.directions_run,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 24,
                    )),
                Icon(
                  Icons.directions_run,
                  size: 24,
                )
              ]),
              const SizedBox(width: 16),
              Container(
                width: MediaQuery.of(context).size.width - 60 - 16 - 24,
                padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[500]!,
                      blurRadius: 10,
                      offset: const Offset(5, 5),
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      blurRadius: 15,
                      offset: Offset(-5, -5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      child: Text(
                        '進捗率$valueSlider%',
                        style: const TextStyle(/*shadows: [
                          Shadow(
                            blurRadius: 2,
                            color: Color.fromARGB(255, 92, 92, 92),
                            offset: Offset(1.5, 1.5),
                          ),
                          Shadow(
                            blurRadius: 2,
                            color: Colors.white,
                            offset: Offset(-1.5, -1.5),
                          )
                        ]*/),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Slider(
                      label: '$valueSlider%',
                      min: 0,
                      max: 100,
                      activeColor: col['accent2'],
                      inactiveColor: col['appbar'],
                      divisions: 4,
                      onChanged: (value) => ref
                          .read(sliderValueNotifierProvider.notifier)
                          .update(value),
                      value: valueSlider,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              const Stack(children: [
                Positioned(
                  left: 1.2,
                  top: 1.2,
                  child: Icon(
                    Icons.comment,
                    color: Color.fromARGB(255, 92, 92, 92),
                    size: 24,
                  ),
                ),
                Positioned(
                  left: -1.2,
                  top: -1.2,
                  child: Icon(
                    Icons.comment,
                    color: Color.fromARGB(255, 255, 255, 255),
                    size: 24,
                  ),
                ),
                Icon(Icons.comment, size: 24,),
              ]),
              const SizedBox(width: 16),
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width - 60 - 16 - 24,
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[500]!,
                        blurRadius: 10,
                        offset: const Offset(5, 5),
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        blurRadius: 15,
                        offset: Offset(-5, -5),
                      ),
                    ],
                  ),
                  child: TextField(
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: '何をした?',
                    ),
                    controller: ref.watch(progressControllerProvider(progress)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[500]!,
                  blurRadius: 10,
                  offset: const Offset(5, 5),
                ),
                const BoxShadow(
                  color: Colors.white,
                  blurRadius: 15,
                  offset: Offset(-5, -5),
                ),
              ],
            ),
            child: CreateAchieveButton(
              progress,
              valueSlider,
              taskTitle,
            ),
          ),
        ],
      ),
    );
  }
}
