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
    required double achieveLevel,
    required int likes,
    required bool isLiked,
  }) = _Progress;

factory Progress.fromJson(Map<String, dynamic> json) => _$ProgressFromJson(json);
}