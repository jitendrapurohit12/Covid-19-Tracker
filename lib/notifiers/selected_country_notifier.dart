import 'package:covid_19/enums/notifier_state.dart';
import 'package:covid_19/models/covid_model.dart';
import 'package:flutter/material.dart';

class SelectedCountryNotifier extends ChangeNotifier {
  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;

  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  Countries selectedCountry;

  void setSelectedFlag(Countries model) {
    _setState(NotifierState.loading);
    selectedCountry = model;
    _setState(NotifierState.loaded);
  }
}
