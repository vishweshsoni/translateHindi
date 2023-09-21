part of 't_and_c_cubit.dart';

@Freezed(
  equal: false,
)
class TermsAndConditionState with _$TermsAndConditionState {
  const TermsAndConditionState._();

  const factory TermsAndConditionState.initial() = Initial;

  const factory TermsAndConditionState.loading() = Loading;

  const factory TermsAndConditionState.success({
    required List<TermsAndCondition> data,
    required bool shouldAllow,
  }) = Success;

  const factory TermsAndConditionState.empty() = Empty;

  const factory TermsAndConditionState.error({
    required String message,
  }) = Error;

  const factory TermsAndConditionState.noInternet() = NoInternet;

  bool get isInitial => this is Initial;

  bool get isLoading => this is Loading;

  bool get isSuccess => this is Success;

  bool get isError => this is Error;

  bool get isEmpty => this is Empty;

  bool get isNoInternet => this is NoInternet;
}
