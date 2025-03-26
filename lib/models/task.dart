import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
abstract class Task with _$Task {
  const factory Task({
    required String id,
    required String taskTitle,
    required String createdBy, /// タスクの作成者
    required String penalty,
    required double score,
    required int likes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Task;

factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}