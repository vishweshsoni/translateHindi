// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_and_condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TermsAndCondition _$$_TermsAndConditionFromJson(Map<String, dynamic> json) =>
    _$_TermsAndCondition(
      id: json['id'] as int?,
      value: json['value'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      shouldShowHindi: json['shouldShow'] as bool?,
    );

Map<String, dynamic> _$$_TermsAndConditionToJson(
        _$_TermsAndCondition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'shouldShow': instance.shouldShowHindi,
    };
