import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/models/task.dart';
import 'package:flutter_jr_hackathon/sheet/button/create_task_button.dart';
import 'package:flutter_jr_hackathon/style/color.dart';
import 'package:flutter_jr_hackathon/task/task_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

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
          Divider(
            color: Colors.grey[500],
            thickness: 2,
          ),
          const Gap(20),
          const Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Gap(40),
                  Text('タスクを追加しよう！',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              )),
          const Gap(14),
          Row(
            children: [
              const Stack(
                children: [
                  Positioned(
                    left: 1.2,
                    top: 1.2,
                    child: Icon(
                      Icons.edit,
                      color: Color.fromARGB(255, 92, 92, 92),
                      size: 24,
                    ),
                  ),
                  Positioned(
                    left: -1.2,
                    top: -1.2,
                    child: Icon(
                      Icons.edit,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 24,
                    ),
                  ),
                  Icon(Icons.edit, size: 24),
                ],
              ),
              const Gap(16),
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
                        blurRadius: 10,
                        offset: Offset(-5, -5),
                      ),
                    ],
                  ),
                  child: TextField(
                    cursorColor: col['accent1'],
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: '何をしたい?',
                      focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: col['accent1'] ?? Colors.black,
                        )),
                    ),
                    controller: ref.watch(titleControllerProvider(task)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Gap(40),
                Text('ペナルティを設定しよう！',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const Gap(14),
          //const SizedBox(height: 16),
          Row(
            children: [
              const Stack(
                children: [
                  Positioned(
                    left: 1.2,
                    top: 1.2,
                    child: Icon(
                      Icons.edit,
                      color: Color.fromARGB(255, 92, 92, 92),
                      size: 24,
                    ),
                  ),
                  Positioned(
                    left: -1.2,
                    top: -1.2,
                    child: Icon(
                      Icons.edit,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 24,
                    ),
                  ),
                  Icon(Icons.edit, size: 24),
                ],
              ),
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
                        blurRadius: 10,
                        offset: Offset(-5, -5),
                      ),
                    ],
                  ),
                  child: TextField(
                    cursorColor: col['accent1'],
                    maxLines: null,
                    decoration: InputDecoration(
                        hintText: '達成できなかったらどうする?',
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: col['accent1'] ?? Colors.black,
                        ))),
                    controller: ref.watch(penaltyControllerProvider(task)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[500]!,
                  blurRadius: 10,
                  offset: const Offset(5, 5),
                ),
                const BoxShadow(
                  color: Colors.white,
                  blurRadius: 10,
                  offset: Offset(-5, -5),
                ),
              ],
            ),
            child: CreateTaskButton(task),
          ),
        ],
      ),
    );
  }
}
