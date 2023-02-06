// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Report _$ReportFromJson(Map<String, dynamic> json) {
  return _Report.fromJson(json);
}

/// @nodoc
mixin _$Report {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get from => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String? get experience => throw _privateConstructorUsedError;
  String? get logFileData => throw _privateConstructorUsedError;
  Map<String, dynamic>? get deviceInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportCopyWith<Report> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportCopyWith<$Res> {
  factory $ReportCopyWith(Report value, $Res Function(Report) then) =
      _$ReportCopyWithImpl<$Res, Report>;
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String from,
      DateTime createdAt,
      String image,
      String? experience,
      String? logFileData,
      Map<String, dynamic>? deviceInfo});
}

/// @nodoc
class _$ReportCopyWithImpl<$Res, $Val extends Report>
    implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? from = null,
    Object? createdAt = null,
    Object? image = null,
    Object? experience = freezed,
    Object? logFileData = freezed,
    Object? deviceInfo = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      experience: freezed == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as String?,
      logFileData: freezed == logFileData
          ? _value.logFileData
          : logFileData // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceInfo: freezed == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReportCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$$_ReportCopyWith(_$_Report value, $Res Function(_$_Report) then) =
      __$$_ReportCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String from,
      DateTime createdAt,
      String image,
      String? experience,
      String? logFileData,
      Map<String, dynamic>? deviceInfo});
}

/// @nodoc
class __$$_ReportCopyWithImpl<$Res>
    extends _$ReportCopyWithImpl<$Res, _$_Report>
    implements _$$_ReportCopyWith<$Res> {
  __$$_ReportCopyWithImpl(_$_Report _value, $Res Function(_$_Report) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? from = null,
    Object? createdAt = null,
    Object? image = null,
    Object? experience = freezed,
    Object? logFileData = freezed,
    Object? deviceInfo = freezed,
  }) {
    return _then(_$_Report(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      experience: freezed == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as String?,
      logFileData: freezed == logFileData
          ? _value.logFileData
          : logFileData // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceInfo: freezed == deviceInfo
          ? _value._deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Report implements _Report {
  const _$_Report(
      {required this.id,
      required this.title,
      required this.content,
      required this.from,
      required this.createdAt,
      required this.image,
      this.experience,
      required this.logFileData,
      required final Map<String, dynamic>? deviceInfo})
      : _deviceInfo = deviceInfo;

  factory _$_Report.fromJson(Map<String, dynamic> json) =>
      _$$_ReportFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String content;
  @override
  final String from;
  @override
  final DateTime createdAt;
  @override
  final String image;
  @override
  final String? experience;
  @override
  final String? logFileData;
  final Map<String, dynamic>? _deviceInfo;
  @override
  Map<String, dynamic>? get deviceInfo {
    final value = _deviceInfo;
    if (value == null) return null;
    if (_deviceInfo is EqualUnmodifiableMapView) return _deviceInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Report(id: $id, title: $title, content: $content, from: $from, createdAt: $createdAt, image: $image, experience: $experience, logFileData: $logFileData, deviceInfo: $deviceInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Report &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.logFileData, logFileData) ||
                other.logFileData == logFileData) &&
            const DeepCollectionEquality()
                .equals(other._deviceInfo, _deviceInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      content,
      from,
      createdAt,
      image,
      experience,
      logFileData,
      const DeepCollectionEquality().hash(_deviceInfo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportCopyWith<_$_Report> get copyWith =>
      __$$_ReportCopyWithImpl<_$_Report>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportToJson(
      this,
    );
  }
}

abstract class _Report implements Report {
  const factory _Report(
      {required final String id,
      required final String title,
      required final String content,
      required final String from,
      required final DateTime createdAt,
      required final String image,
      final String? experience,
      required final String? logFileData,
      required final Map<String, dynamic>? deviceInfo}) = _$_Report;

  factory _Report.fromJson(Map<String, dynamic> json) = _$_Report.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  String get from;
  @override
  DateTime get createdAt;
  @override
  String get image;
  @override
  String? get experience;
  @override
  String? get logFileData;
  @override
  Map<String, dynamic>? get deviceInfo;
  @override
  @JsonKey(ignore: true)
  _$$_ReportCopyWith<_$_Report> get copyWith =>
      throw _privateConstructorUsedError;
}
