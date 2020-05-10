import 'package:covid_19/enums/notifier_state.dart';
import 'package:covid_19/injection.dart';
import 'package:covid_19/models/covid_model.dart';
import 'package:covid_19/services/api_services.dart';
import 'package:flutter/material.dart';

class CovidNotifier extends ChangeNotifier {
  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;
  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  CovidModel model;

  Future<CovidModel> getCovidData(
    Function(CustomException) failure,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _setState(NotifierState.loading);
    getIt<ApiServices>().getCovidSummaryData().then((value) {
      _setState(NotifierState.loaded);
      model = value;
    }).catchError((e) {
      _setState(NotifierState.error);
      failure(e as CustomException);
    });
    return model;
  }
}
