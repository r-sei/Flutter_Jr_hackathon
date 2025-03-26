import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewTask extends ConsumerWidget {
  const AddNewTask({super.key});

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
          const Row(
            children: [
              Icon(Icons.edit),
              SizedBox(width: 16),
              Flexible(
                child: TextField(
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: '何をしたい?',
                  ),
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
          const Row(
            children: [
              Icon(Icons.edit),
              SizedBox(width: 16),
              Flexible(
                child: TextField(
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: '達成できなかったらどうする?',
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
            child: const Text('設定する!'),
          ),
        ],
      ),
    );
  }
}
