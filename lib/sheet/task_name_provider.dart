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
