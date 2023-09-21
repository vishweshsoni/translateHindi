import 'package:freezed_annotation/freezed_annotation.dart';

part 'terms_and_condition.freezed.dart';

part 'terms_and_condition.g.dart';

@freezed
class TermsAndCondition with _$TermsAndCondition {
  const factory TermsAndCondition({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'value') String? value,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'updatedAt') String? updatedAt,
    @JsonKey(name: 'shouldShow') bool? shouldShowHindi,
  }) = _TermsAndCondition;

  factory TermsAndCondition.fromJson(Map<String, Object?> json) =>
      _$TermsAndConditionFromJson(json);
}
