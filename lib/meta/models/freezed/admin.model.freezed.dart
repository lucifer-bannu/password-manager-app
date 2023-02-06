// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Admin _$AdminFromJson(Map<String, dynamic> json) {
  return _Admin.fromJson(json);
}

/// @nodoc
mixin _$Admin {
  String get id => throw _privateConstructorUsedError;
  String get atSign => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get img => throw _privateConstructorUsedError;
  bool get isSuperAdmin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminCopyWith<Admin> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminCopyWith<$Res> {
  factory $AdminCopyWith(Admin value, $Res Function(Admin) then) =
      _$AdminCopyWithImpl<$Res, Admin>;
  @useResult
  $Res call(
      {String id, String atSign, String name, String? img, bool isSuperAdmin});
}

/// @nodoc
class _$AdminCopyWithImpl<$Res, $Val extends Admin>
    implements $AdminCopyWith<$Res> {
  _$AdminCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? atSign = null,
    Object? name = null,
    Object? img = freezed,
    Object? isSuperAdmin = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      atSign: null == atSign
          ? _value.atSign
          : atSign // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      img: freezed == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuperAdmin: null == isSuperAdmin
          ? _value.isSuperAdmin
          : isSuperAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdminCopyWith<$Res> implements $AdminCopyWith<$Res> {
  factory _$$_AdminCopyWith(_$_Admin value, $Res Function(_$_Admin) then) =
      __$$_AdminCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String atSign, String name, String? img, bool isSuperAdmin});
}

/// @nodoc
class __$$_AdminCopyWithImpl<$Res> extends _$AdminCopyWithImpl<$Res, _$_Admin>
    implements _$$_AdminCopyWith<$Res> {
  __$$_AdminCopyWithImpl(_$_Admin _value, $Res Function(_$_Admin) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? atSign = null,
    Object? name = null,
    Object? img = freezed,
    Object? isSuperAdmin = null,
  }) {
    return _then(_$_Admin(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      atSign: null == atSign
          ? _value.atSign
          : atSign // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      img: freezed == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuperAdmin: null == isSuperAdmin
          ? _value.isSuperAdmin
          : isSuperAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Admin with DiagnosticableTreeMixin implements _Admin {
  const _$_Admin(
      {required this.id,
      required this.atSign,
      required this.name,
      required this.img,
      required this.isSuperAdmin});

  factory _$_Admin.fromJson(Map<String, dynamic> json) =>
      _$$_AdminFromJson(json);

  @override
  final String id;
  @override
  final String atSign;
  @override
  final String name;
  @override
  final String? img;
  @override
  final bool isSuperAdmin;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Admin(id: $id, atSign: $atSign, name: $name, img: $img, isSuperAdmin: $isSuperAdmin)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Admin'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('atSign', atSign))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('img', img))
      ..add(DiagnosticsProperty('isSuperAdmin', isSuperAdmin));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Admin &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.atSign, atSign) || other.atSign == atSign) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.img, img) || other.img == img) &&
            (identical(other.isSuperAdmin, isSuperAdmin) ||
                other.isSuperAdmin == isSuperAdmin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, atSign, name, img, isSuperAdmin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdminCopyWith<_$_Admin> get copyWith =>
      __$$_AdminCopyWithImpl<_$_Admin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdminToJson(
      this,
    );
  }
}

abstract class _Admin implements Admin {
  const factory _Admin(
      {required final String id,
      required final String atSign,
      required final String name,
      required final String? img,
      required final bool isSuperAdmin}) = _$_Admin;

  factory _Admin.fromJson(Map<String, dynamic> json) = _$_Admin.fromJson;

  @override
  String get id;
  @override
  String get atSign;
  @override
  String get name;
  @override
  String? get img;
  @override
  bool get isSuperAdmin;
  @override
  @JsonKey(ignore: true)
  _$$_AdminCopyWith<_$_Admin> get copyWith =>
      throw _privateConstructorUsedError;
}
