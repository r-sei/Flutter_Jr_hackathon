// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProgressImpl _$$ProgressImplFromJson(Map<String, dynamic> json) =>
    _$ProgressImpl(
      progressID: json['progressID'] as String,
      userName: json['userName'] as String,
      taskTitle: json['taskTitle'] as String,
      progressTitle: json['progressTitle'] as String,
      achieveLevel: (json['achieveLevel'] as num).toDouble(),
      likes: (json['likes'] as num).toInt(),
      isLiked: json['isLiked'] as bool,
    );

Map<String, dynamic> _$$ProgressImplToJson(_$ProgressImpl instance) =>
    <String, dynamic>{
      'progressID': instance.progressID,
      'userName': instance.userName,
      'taskTitle': instance.taskTitle,
      'progressTitle': instance.progressTitle,
      'achieveLevel': instance.achieveLevel,
      'likes': instance.likes,
      'isLiked': instance.isLiked,
    };
