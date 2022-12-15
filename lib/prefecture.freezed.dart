// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prefecture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Prefecture _$PrefectureFromJson(Map<String, dynamic> json) {
  return _Prefecture.fromJson(json);
}

/// @nodoc
mixin _$Prefecture {
  String get name => throw _privateConstructorUsedError;
  String get hiragana => throw _privateConstructorUsedError;
  String get roman => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrefectureCopyWith<Prefecture> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrefectureCopyWith<$Res> {
  factory $PrefectureCopyWith(
          Prefecture value, $Res Function(Prefecture) then) =
      _$PrefectureCopyWithImpl<$Res, Prefecture>;
  @useResult
  $Res call({String name, String hiragana, String roman});
}

/// @nodoc
class _$PrefectureCopyWithImpl<$Res, $Val extends Prefecture>
    implements $PrefectureCopyWith<$Res> {
  _$PrefectureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? hiragana = null,
    Object? roman = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hiragana: null == hiragana
          ? _value.hiragana
          : hiragana // ignore: cast_nullable_to_non_nullable
              as String,
      roman: null == roman
          ? _value.roman
          : roman // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrefectureCopyWith<$Res>
    implements $PrefectureCopyWith<$Res> {
  factory _$$_PrefectureCopyWith(
          _$_Prefecture value, $Res Function(_$_Prefecture) then) =
      __$$_PrefectureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String hiragana, String roman});
}

/// @nodoc
class __$$_PrefectureCopyWithImpl<$Res>
    extends _$PrefectureCopyWithImpl<$Res, _$_Prefecture>
    implements _$$_PrefectureCopyWith<$Res> {
  __$$_PrefectureCopyWithImpl(
      _$_Prefecture _value, $Res Function(_$_Prefecture) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? hiragana = null,
    Object? roman = null,
  }) {
    return _then(_$_Prefecture(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hiragana: null == hiragana
          ? _value.hiragana
          : hiragana // ignore: cast_nullable_to_non_nullable
              as String,
      roman: null == roman
          ? _value.roman
          : roman // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Prefecture extends _Prefecture {
  const _$_Prefecture(
      {required this.name, required this.hiragana, required this.roman})
      : super._();

  factory _$_Prefecture.fromJson(Map<String, dynamic> json) =>
      _$$_PrefectureFromJson(json);

  @override
  final String name;
  @override
  final String hiragana;
  @override
  final String roman;

  @override
  String toString() {
    return 'Prefecture(name: $name, hiragana: $hiragana, roman: $roman)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Prefecture &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hiragana, hiragana) ||
                other.hiragana == hiragana) &&
            (identical(other.roman, roman) || other.roman == roman));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, hiragana, roman);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrefectureCopyWith<_$_Prefecture> get copyWith =>
      __$$_PrefectureCopyWithImpl<_$_Prefecture>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PrefectureToJson(
      this,
    );
  }
}

abstract class _Prefecture extends Prefecture {
  const factory _Prefecture(
      {required final String name,
      required final String hiragana,
      required final String roman}) = _$_Prefecture;
  const _Prefecture._() : super._();

  factory _Prefecture.fromJson(Map<String, dynamic> json) =
      _$_Prefecture.fromJson;

  @override
  String get name;
  @override
  String get hiragana;
  @override
  String get roman;
  @override
  @JsonKey(ignore: true)
  _$$_PrefectureCopyWith<_$_Prefecture> get copyWith =>
      throw _privateConstructorUsedError;
}
