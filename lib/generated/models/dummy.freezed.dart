// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../models/dummy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Dummy _$DummyFromJson(Map<String, dynamic> json) {
  return _Dummy.fromJson(json);
}

/// @nodoc
mixin _$Dummy {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DummyCopyWith<Dummy> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DummyCopyWith<$Res> {
  factory $DummyCopyWith(Dummy value, $Res Function(Dummy) then) =
      _$DummyCopyWithImpl<$Res, Dummy>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$DummyCopyWithImpl<$Res, $Val extends Dummy>
    implements $DummyCopyWith<$Res> {
  _$DummyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DummyCopyWith<$Res> implements $DummyCopyWith<$Res> {
  factory _$$_DummyCopyWith(_$_Dummy value, $Res Function(_$_Dummy) then) =
      __$$_DummyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$_DummyCopyWithImpl<$Res> extends _$DummyCopyWithImpl<$Res, _$_Dummy>
    implements _$$_DummyCopyWith<$Res> {
  __$$_DummyCopyWithImpl(_$_Dummy _value, $Res Function(_$_Dummy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_Dummy(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Dummy implements _Dummy {
  const _$_Dummy(this.id, this.name);

  factory _$_Dummy.fromJson(Map<String, dynamic> json) =>
      _$$_DummyFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'Dummy(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Dummy &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DummyCopyWith<_$_Dummy> get copyWith =>
      __$$_DummyCopyWithImpl<_$_Dummy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DummyToJson(
      this,
    );
  }
}

abstract class _Dummy implements Dummy {
  const factory _Dummy(final String id, final String name) = _$_Dummy;

  factory _Dummy.fromJson(Map<String, dynamic> json) = _$_Dummy.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_DummyCopyWith<_$_Dummy> get copyWith =>
      throw _privateConstructorUsedError;
}
