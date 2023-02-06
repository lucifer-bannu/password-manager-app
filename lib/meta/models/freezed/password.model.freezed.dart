// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Password _$PasswordFromJson(Map<String, dynamic> json) {
  return _Password.fromJson(json);
}

/// @nodoc
mixin _$Password {
  String get id => throw _privateConstructorUsedError;
  String get favicon => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PasswordCopyWith<Password> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordCopyWith<$Res> {
  factory $PasswordCopyWith(Password value, $Res Function(Password) then) =
      _$PasswordCopyWithImpl<$Res, Password>;
  @useResult
  $Res call({String id, String favicon, String name, String password});
}

/// @nodoc
class _$PasswordCopyWithImpl<$Res, $Val extends Password>
    implements $PasswordCopyWith<$Res> {
  _$PasswordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? favicon = null,
    Object? name = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      favicon: null == favicon
          ? _value.favicon
          : favicon // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PasswordCopyWith<$Res> implements $PasswordCopyWith<$Res> {
  factory _$$_PasswordCopyWith(
          _$_Password value, $Res Function(_$_Password) then) =
      __$$_PasswordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String favicon, String name, String password});
}

/// @nodoc
class __$$_PasswordCopyWithImpl<$Res>
    extends _$PasswordCopyWithImpl<$Res, _$_Password>
    implements _$$_PasswordCopyWith<$Res> {
  __$$_PasswordCopyWithImpl(
      _$_Password _value, $Res Function(_$_Password) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? favicon = null,
    Object? name = null,
    Object? password = null,
  }) {
    return _then(_$_Password(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      favicon: null == favicon
          ? _value.favicon
          : favicon // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Password implements _Password {
  const _$_Password(
      {required this.id,
      required this.favicon,
      required this.name,
      required this.password});

  factory _$_Password.fromJson(Map<String, dynamic> json) =>
      _$$_PasswordFromJson(json);

  @override
  final String id;
  @override
  final String favicon;
  @override
  final String name;
  @override
  final String password;

  @override
  String toString() {
    return 'Password(id: $id, favicon: $favicon, name: $name, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Password &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.favicon, favicon) || other.favicon == favicon) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, favicon, name, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PasswordCopyWith<_$_Password> get copyWith =>
      __$$_PasswordCopyWithImpl<_$_Password>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PasswordToJson(
      this,
    );
  }
}

abstract class _Password implements Password {
  const factory _Password(
      {required final String id,
      required final String favicon,
      required final String name,
      required final String password}) = _$_Password;

  factory _Password.fromJson(Map<String, dynamic> json) = _$_Password.fromJson;

  @override
  String get id;
  @override
  String get favicon;
  @override
  String get name;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_PasswordCopyWith<_$_Password> get copyWith =>
      throw _privateConstructorUsedError;
}
