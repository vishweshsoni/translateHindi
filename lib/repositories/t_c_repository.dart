import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:translate_module/models/terms_and_condition.dart';
import 'package:translate_module/utils/app_constants.dart';
import 'package:translate_module/utils/preference_helper.dart';

class TermsAndConditionRepository {
  Future<List<TermsAndCondition>> getTermsAndCondition() async {
    String data = await SharedPreferenceHelper().getLocalData();
    List<TermsAndCondition> pages = [];
    List<dynamic> jsonData = [];
    if (data == null || data.isEmpty) {
      final jsonString =
          await rootBundle.loadString(AppConstants.termsAndConditionModelPath);
      SharedPreferenceHelper().saveLocalData(value: jsonString);
      jsonData = json.decode(jsonString);
      pages = jsonData
          .map((dynamic json) => TermsAndCondition.fromJson(json))
          .toList();
    } else {
      jsonData = json.decode(data);
      pages = jsonData
          .map((dynamic json) => TermsAndCondition.fromJson(json))
          .toList();
    }
    return pages;
  }

  Future<void> saveModifiedData({required List<TermsAndCondition> data}) {
    return SharedPreferenceHelper().saveLocalData(value: json.encode(data));
  }
}
