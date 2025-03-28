import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jr_hackathon/core/firebase_providers.dart';
import 'package:flutter_jr_hackathon/models/task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'task_view_model.g.dart';

@riverpod
Stream<QuerySnapshot<Map<String, dynamic>>> tasks(Ref ref) {
  final snapshots = ref.read(taskCollectionProvider).snapshots();
  return snapshots;
}

//タスクタイトル用のtextEditingController
@riverpod
TextEditingController titleController(Ref ref, Task? task) {
  return TextEditingController(text: task?.taskTitle);
}

//ペナルティ用のtextEditingController
@riverpod
TextEditingController penaltyController(Ref ref, Task? task) {
  return TextEditingController(text: task?.penalty);
}

@riverpod
class TaskEdit extends _$TaskEdit {
  @override
  String build() {
    return '';
  }

  //タスク作成
  Future<void> create(
      String title, String penalty, String currentUserName) async {
    final task = Task(
        id: const Uuid().v4(),
        taskTitle: title,
        createdBy: currentUserName,
        penalty: penalty,
        groupName: 'Friends',
        score: 0,
        likes: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());

    await ref.read(taskCollectionProvider).doc(task.id).set(task.toJson());
  }

  //タスクのタイトル変更
  Future<void> editTitle(String title, String id) async {
    await ref.read(taskCollectionProvider).doc(id).update({'taskTitle': title});
  }

  //ペナルティ変更
  Future<void> editPenalty(String penalty, String id) async {
    await ref.read(taskCollectionProvider).doc(id).update({'penalty': penalty});
  }

  Future<void> getAverageLike() async {
    final res = ref
        .read(homeCollectionProvider)
        .where('taskTitle', isEqualTo: 'Task 2');
    print(res);
  }
}
