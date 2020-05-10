import 'package:covid_19/models/covid_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiServices {
  final Dio _dio = Dio();
  static const String kCovidBaseUrl = 'https://api.covid19api.com';
  final String kCovidSummaryUrl = '$kCovidBaseUrl/summary';
  final int kRequestTimeoutTime = 15;

  Future<CovidModel> getCovidSummaryData() async {
    try {
      final response = await _dio.get(kCovidSummaryUrl).timeout(
            Duration(seconds: kRequestTimeoutTime),
            onTimeout: () => null,
          );
      final model = CovidModel.fromJson(response.data as Map<String, dynamic>);
      return model;
    } catch (e) {
      throw _throwException(e);
    }
  }

  CustomException _throwException(e) {
    final String errorMessage =
        (e?.error?.message ?? e?.response?.data['message']) as String;
    return CustomException(
      message: errorMessage,
    );
  }
}

class CustomException {
  final String message;
  final int code;

  CustomException({@required this.message, this.code = 00});
}
