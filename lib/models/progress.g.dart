// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProgressImpl _$$ProgressImplFromJson(Map<String, dynamic> json) =>
    _$ProgressImpl(
      progressID: json['progressID'] as String,
      userName: json['userName'] as String,
      progressTitle: json['progressTitle'] as String,
      achieveLevel: (json['achieveLevel'] as num).toDouble(),
      likes: (json['likes'] as num).toInt(),
    );

Map<String, dynamic> _$$ProgressImplToJson(_$ProgressImpl instance) =>
    <String, dynamic>{
      'progressID': instance.progressID,
      'userName': instance.userName,
      'progressTitle': instance.progressTitle,
      'achieveLevel': instance.achieveLevel,
      'likes': instance.likes,
    };
