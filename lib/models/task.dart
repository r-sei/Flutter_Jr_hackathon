import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_jr_hackathon/models/timestamp_convert.dart';
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
    required String groupName,
    required double score,
    required int likes,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
  }) = _Task;

factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}