import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_jr_hackathon/models/timestamp_convert.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress.freezed.dart';
part 'progress.g.dart';

@freezed
abstract class Progress with _$Progress {
  const factory Progress({
    required String progressID,
    required String userName,
    required String taskTitle,
    required String progressTitle,
    required String groupName,
    required double achieveLevel,
    required List<String> likes,
    @TimestampConverter() required DateTime createdAt,
  }) = _Progress;

  factory Progress.fromJson(Map<String, dynamic> json) =>
      _$ProgressFromJson(json);
}
