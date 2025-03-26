// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Progress _$ProgressFromJson(Map<String, dynamic> json) {
  return _Progress.fromJson(json);
}

/// @nodoc
mixin _$Progress {
  String get progressID => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get progressTitle => throw _privateConstructorUsedError;
  double get achieveLevel => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;

  /// Serializes this Progress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Progress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProgressCopyWith<Progress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressCopyWith<$Res> {
  factory $ProgressCopyWith(Progress value, $Res Function(Progress) then) =
      _$ProgressCopyWithImpl<$Res, Progress>;
  @useResult
  $Res call(
      {String progressID,
      String userName,
      String progressTitle,
      double achieveLevel,
      int likes});
}

/// @nodoc
class _$ProgressCopyWithImpl<$Res, $Val extends Progress>
    implements $ProgressCopyWith<$Res> {
  _$ProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Progress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progressID = null,
    Object? userName = null,
    Object? progressTitle = null,
    Object? achieveLevel = null,
    Object? likes = null,
  }) {
    return _then(_value.copyWith(
      progressID: null == progressID
          ? _value.progressID
          : progressID // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      progressTitle: null == progressTitle
          ? _value.progressTitle
          : progressTitle // ignore: cast_nullable_to_non_nullable
              as String,
      achieveLevel: null == achieveLevel
          ? _value.achieveLevel
          : achieveLevel // ignore: cast_nullable_to_non_nullable
              as double,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgressImplCopyWith<$Res>
    implements $ProgressCopyWith<$Res> {
  factory _$$ProgressImplCopyWith(
          _$ProgressImpl value, $Res Function(_$ProgressImpl) then) =
      __$$ProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String progressID,
      String userName,
      String progressTitle,
      double achieveLevel,
      int likes});
}

/// @nodoc
class __$$ProgressImplCopyWithImpl<$Res>
    extends _$ProgressCopyWithImpl<$Res, _$ProgressImpl>
    implements _$$ProgressImplCopyWith<$Res> {
  __$$ProgressImplCopyWithImpl(
      _$ProgressImpl _value, $Res Function(_$ProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of Progress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progressID = null,
    Object? userName = null,
    Object? progressTitle = null,
    Object? achieveLevel = null,
    Object? likes = null,
  }) {
    return _then(_$ProgressImpl(
      progressID: null == progressID
          ? _value.progressID
          : progressID // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      progressTitle: null == progressTitle
          ? _value.progressTitle
          : progressTitle // ignore: cast_nullable_to_non_nullable
              as String,
      achieveLevel: null == achieveLevel
          ? _value.achieveLevel
          : achieveLevel // ignore: cast_nullable_to_non_nullable
              as double,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgressImpl implements _Progress {
  const _$ProgressImpl(
      {required this.progressID,
      required this.userName,
      required this.progressTitle,
      required this.achieveLevel,
      required this.likes});

  factory _$ProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgressImplFromJson(json);

  @override
  final String progressID;
  @override
  final String userName;
  @override
  final String progressTitle;
  @override
  final double achieveLevel;
  @override
  final int likes;

  @override
  String toString() {
    return 'Progress(progressID: $progressID, userName: $userName, progressTitle: $progressTitle, achieveLevel: $achieveLevel, likes: $likes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressImpl &&
            (identical(other.progressID, progressID) ||
                other.progressID == progressID) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.progressTitle, progressTitle) ||
                other.progressTitle == progressTitle) &&
            (identical(other.achieveLevel, achieveLevel) ||
                other.achieveLevel == achieveLevel) &&
            (identical(other.likes, likes) || other.likes == likes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, progressID, userName, progressTitle, achieveLevel, likes);

  /// Create a copy of Progress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressImplCopyWith<_$ProgressImpl> get copyWith =>
      __$$ProgressImplCopyWithImpl<_$ProgressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgressImplToJson(
      this,
    );
  }
}

abstract class _Progress implements Progress {
  const factory _Progress(
      {required final String progressID,
      required final String userName,
      required final String progressTitle,
      required final double achieveLevel,
      required final int likes}) = _$ProgressImpl;

  factory _Progress.fromJson(Map<String, dynamic> json) =
      _$ProgressImpl.fromJson;

  @override
  String get progressID;
  @override
  String get userName;
  @override
  String get progressTitle;
  @override
  double get achieveLevel;
  @override
  int get likes;

  /// Create a copy of Progress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgressImplCopyWith<_$ProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
