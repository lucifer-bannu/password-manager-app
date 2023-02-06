// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plots.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Plots {
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlotsCopyWith<Plots> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlotsCopyWith<$Res> {
  factory $PlotsCopyWith(Plots value, $Res Function(Plots) then) =
      _$PlotsCopyWithImpl<$Res, Plots>;
  @useResult
  $Res call({double x, double y});
}

/// @nodoc
class _$PlotsCopyWithImpl<$Res, $Val extends Plots>
    implements $PlotsCopyWith<$Res> {
  _$PlotsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlotsCopyWith<$Res> implements $PlotsCopyWith<$Res> {
  factory _$$_PlotsCopyWith(_$_Plots value, $Res Function(_$_Plots) then) =
      __$$_PlotsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double x, double y});
}

/// @nodoc
class __$$_PlotsCopyWithImpl<$Res> extends _$PlotsCopyWithImpl<$Res, _$_Plots>
    implements _$$_PlotsCopyWith<$Res> {
  __$$_PlotsCopyWithImpl(_$_Plots _value, $Res Function(_$_Plots) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_$_Plots(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_Plots implements _Plots {
  const _$_Plots({required this.x, required this.y});

  @override
  final double x;
  @override
  final double y;

  @override
  String toString() {
    return 'Plots(x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Plots &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @override
  int get hashCode => Object.hash(runtimeType, x, y);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlotsCopyWith<_$_Plots> get copyWith =>
      __$$_PlotsCopyWithImpl<_$_Plots>(this, _$identity);
}

abstract class _Plots implements Plots {
  const factory _Plots({required final double x, required final double y}) =
      _$_Plots;

  @override
  double get x;
  @override
  double get y;
  @override
  @JsonKey(ignore: true)
  _$$_PlotsCopyWith<_$_Plots> get copyWith =>
      throw _privateConstructorUsedError;
}
