// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QrModel {
  String get atSign => throw _privateConstructorUsedError;
  String get cramSecret => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QrModelCopyWith<QrModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrModelCopyWith<$Res> {
  factory $QrModelCopyWith(QrModel value, $Res Function(QrModel) then) =
      _$QrModelCopyWithImpl<$Res, QrModel>;
  @useResult
  $Res call({String atSign, String cramSecret});
}

/// @nodoc
class _$QrModelCopyWithImpl<$Res, $Val extends QrModel>
    implements $QrModelCopyWith<$Res> {
  _$QrModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? atSign = null,
    Object? cramSecret = null,
  }) {
    return _then(_value.copyWith(
      atSign: null == atSign
          ? _value.atSign
          : atSign // ignore: cast_nullable_to_non_nullable
              as String,
      cramSecret: null == cramSecret
          ? _value.cramSecret
          : cramSecret // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QrModelCopyWith<$Res> implements $QrModelCopyWith<$Res> {
  factory _$$_QrModelCopyWith(
          _$_QrModel value, $Res Function(_$_QrModel) then) =
      __$$_QrModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String atSign, String cramSecret});
}

/// @nodoc
class __$$_QrModelCopyWithImpl<$Res>
    extends _$QrModelCopyWithImpl<$Res, _$_QrModel>
    implements _$$_QrModelCopyWith<$Res> {
  __$$_QrModelCopyWithImpl(_$_QrModel _value, $Res Function(_$_QrModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? atSign = null,
    Object? cramSecret = null,
  }) {
    return _then(_$_QrModel(
      atSign: null == atSign
          ? _value.atSign
          : atSign // ignore: cast_nullable_to_non_nullable
              as String,
      cramSecret: null == cramSecret
          ? _value.cramSecret
          : cramSecret // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_QrModel implements _QrModel {
  const _$_QrModel({required this.atSign, required this.cramSecret});

  @override
  final String atSign;
  @override
  final String cramSecret;

  @override
  String toString() {
    return 'QrModel(atSign: $atSign, cramSecret: $cramSecret)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QrModel &&
            (identical(other.atSign, atSign) || other.atSign == atSign) &&
            (identical(other.cramSecret, cramSecret) ||
                other.cramSecret == cramSecret));
  }

  @override
  int get hashCode => Object.hash(runtimeType, atSign, cramSecret);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QrModelCopyWith<_$_QrModel> get copyWith =>
      __$$_QrModelCopyWithImpl<_$_QrModel>(this, _$identity);
}

abstract class _QrModel implements QrModel {
  const factory _QrModel(
      {required final String atSign,
      required final String cramSecret}) = _$_QrModel;

  @override
  String get atSign;
  @override
  String get cramSecret;
  @override
  @JsonKey(ignore: true)
  _$$_QrModelCopyWith<_$_QrModel> get copyWith =>
      throw _privateConstructorUsedError;
}
