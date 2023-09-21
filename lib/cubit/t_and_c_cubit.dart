import 'dart:io';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:translate_module/models/terms_and_condition.dart';
import 'package:translate_module/repositories/t_c_repository.dart';
import 'package:translate_module/utils/app_constants.dart';

part 't_and_c_cubit.freezed.dart';

part 't_and_c_state.dart';

class TermsAndConditionCubit extends Cubit<TermsAndConditionState> {
  final TermsAndConditionRepository termsAndConditionRepository;

  List<TermsAndCondition> data = [];
  List<TermsAndCondition> pages = [];
  bool allowToFetchMore = false;
  int offset = 10;

  TermsAndConditionCubit({required this.termsAndConditionRepository})
      : super(const Initial());

  Future<void> getData() async {
    try {
      if (state is Loading) return;

      emit(const Loading());

      final jsonData = pages.isNotEmpty
          ? pages
          : await termsAndConditionRepository.getTermsAndCondition();

      if (jsonData.isNotEmpty) {
        data = List.from(jsonData);
        allowToFetchMore = data.length > 10;
        offset = 10;
        pages = data.sublist(0, offset);
        emit(Success(data: pages, shouldAllow: allowToFetchMore));
      } else {
        handleError(AppConstants.somethingWentWrong);
      }
    } on SocketException {
      emit(const NoInternet());
    } catch (e) {
      handleError(e);
    }
  }

  Future<void> getMoreSearchResults() async {
    try {
      if (allowToFetchMore) {
        var lastPage = offset;
        offset += 10;
        final newPages = data.skip(lastPage).take(offset - lastPage).toList();

        if (newPages.isNotEmpty) {
          pages.addAll(newPages);
          data = List.from(pages);
          allowToFetchMore = true;
          emit(Success(data: pages, shouldAllow: allowToFetchMore));
        } else {
          allowToFetchMore = false;
          emit(Success(data: pages, shouldAllow: allowToFetchMore));
        }
      }
    } on SocketException {
      emit(const NoInternet());
    } catch (e) {
      handleError(e);
    }
  }

  void handleError(dynamic error) {
    error = error.toString();
    error = error.isNotEmpty ? error : AppConstants.somethingWentWrong;
    emit(Error(message: error));
  }

  Future<bool> addTermsAndCondition(
      {required String value, required int id}) async {
    try {
      if (id != 0) {
        TermsAndCondition? term = findTermById(id, pages);
        if (term != null) {
          int index = pages.indexOf(term);
          term = term.copyWith(value: value);
          pages[index] = term;
          termsAndConditionRepository.saveModifiedData(data: pages);
          getData();
          return true;
        }
      } else {
        pages.add(TermsAndCondition(
          id: Random().nextInt(7618),
          value: value,
          createdAt: DateTime.now().toString(),
          updatedAt: DateTime.now().toString(),
        ));
        termsAndConditionRepository.saveModifiedData(data: pages);
      }

      getData();
      return true;
    } catch (e) {
      return false;
    }
  }

  TermsAndCondition? findTermById(int id, List<TermsAndCondition> pages) {
    try {
      return pages.firstWhere((element) => element.id == id);
    } catch (e) {
      return null; // If no element with the specified id is found, return null
    }
  }
}
