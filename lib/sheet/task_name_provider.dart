import 'package:flutter_jr_hackathon/core/firebase_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_name_provider.g.dart';

@riverpod
class TaskNameNotifier extends _$TaskNameNotifier {
  @override
  String build() {
    return '';
  }

  void selectTask(String taskType) {
    state = taskType;
  }
}

@riverpod
Future<List<String>> taskTitles(Ref ref) async {
  final snapshot = await ref.read(taskCollectionProvider).get();
  return snapshot.docs.map((e) => e.data()['taskTitle'] as String).toList();
}

