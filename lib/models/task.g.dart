// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as String,
      taskTitle: json['taskTitle'] as String,
      createdBy: json['createdBy'] as String,
      penalty: json['penalty'] as String,
      groupName: json['groupName'] as String,
      score: (json['score'] as num).toDouble(),
      likes: (json['likes'] as num).toInt(),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskTitle': instance.taskTitle,
      'createdBy': instance.createdBy,
      'penalty': instance.penalty,
      'groupName': instance.groupName,
      'score': instance.score,
      'likes': instance.likes,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
