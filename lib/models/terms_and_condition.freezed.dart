// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms_and_condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TermsAndCondition _$TermsAndConditionFromJson(Map<String, dynamic> json) {
  return _TermsAndCondition.fromJson(json);
}

/// @nodoc
mixin _$TermsAndCondition {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'value')
  String? get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'shouldShow')
  bool? get shouldShowHindi => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TermsAndConditionCopyWith<TermsAndCondition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermsAndConditionCopyWith<$Res> {
  factory $TermsAndConditionCopyWith(
          TermsAndCondition value, $Res Function(TermsAndCondition) then) =
      _$TermsAndConditionCopyWithImpl<$Res, TermsAndCondition>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'value') String? value,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'updatedAt') String? updatedAt,
      @JsonKey(name: 'shouldShow') bool? shouldShowHindi});
}

/// @nodoc
class _$TermsAndConditionCopyWithImpl<$Res, $Val extends TermsAndCondition>
    implements $TermsAndConditionCopyWith<$Res> {
  _$TermsAndConditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? value = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? shouldShowHindi = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      shouldShowHindi: freezed == shouldShowHindi
          ? _value.shouldShowHindi
          : shouldShowHindi // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TermsAndConditionCopyWith<$Res>
    implements $TermsAndConditionCopyWith<$Res> {
  factory _$$_TermsAndConditionCopyWith(_$_TermsAndCondition value,
          $Res Function(_$_TermsAndCondition) then) =
      __$$_TermsAndConditionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'value') String? value,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'updatedAt') String? updatedAt,
      @JsonKey(name: 'shouldShow') bool? shouldShowHindi});
}

/// @nodoc
class __$$_TermsAndConditionCopyWithImpl<$Res>
    extends _$TermsAndConditionCopyWithImpl<$Res, _$_TermsAndCondition>
    implements _$$_TermsAndConditionCopyWith<$Res> {
  __$$_TermsAndConditionCopyWithImpl(
      _$_TermsAndCondition _value, $Res Function(_$_TermsAndCondition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? value = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? shouldShowHindi = freezed,
  }) {
    return _then(_$_TermsAndCondition(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      shouldShowHindi: freezed == shouldShowHindi
          ? _value.shouldShowHindi
          : shouldShowHindi // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TermsAndCondition implements _TermsAndCondition {
  const _$_TermsAndCondition(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'value') this.value,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'updatedAt') this.updatedAt,
      @JsonKey(name: 'shouldShow') this.shouldShowHindi});

  factory _$_TermsAndCondition.fromJson(Map<String, dynamic> json) =>
      _$$_TermsAndConditionFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'value')
  final String? value;
  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;
  @override
  @JsonKey(name: 'shouldShow')
  final bool? shouldShowHindi;

  @override
  String toString() {
    return 'TermsAndCondition(id: $id, value: $value, createdAt: $createdAt, updatedAt: $updatedAt, shouldShowHindi: $shouldShowHindi)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TermsAndCondition &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.shouldShowHindi, shouldShowHindi) ||
                other.shouldShowHindi == shouldShowHindi));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, value, createdAt, updatedAt, shouldShowHindi);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TermsAndConditionCopyWith<_$_TermsAndCondition> get copyWith =>
      __$$_TermsAndConditionCopyWithImpl<_$_TermsAndCondition>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TermsAndConditionToJson(
      this,
    );
  }
}

abstract class _TermsAndCondition implements TermsAndCondition {
  const factory _TermsAndCondition(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'value') final String? value,
          @JsonKey(name: 'createdAt') final String? createdAt,
          @JsonKey(name: 'updatedAt') final String? updatedAt,
          @JsonKey(name: 'shouldShow') final bool? shouldShowHindi}) =
      _$_TermsAndCondition;

  factory _TermsAndCondition.fromJson(Map<String, dynamic> json) =
      _$_TermsAndCondition.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'value')
  String? get value;
  @override
  @JsonKey(name: 'createdAt')
  String? get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  String? get updatedAt;
  @override
  @JsonKey(name: 'shouldShow')
  bool? get shouldShowHindi;
  @override
  @JsonKey(ignore: true)
  _$$_TermsAndConditionCopyWith<_$_TermsAndCondition> get copyWith =>
      throw _privateConstructorUsedError;
}
