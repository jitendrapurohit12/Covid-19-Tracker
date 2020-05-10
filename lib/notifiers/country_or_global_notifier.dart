import 'package:covid_19/enums/notifier_state.dart';
import 'package:flutter/material.dart';

class CountryOrGlobalNotifier extends ChangeNotifier {
  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;

  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  bool isGlobalSelected = false;

  void setGlobalSelected({@required bool value}) {
    _setState(NotifierState.loading);
    isGlobalSelected = value;
    _setState(NotifierState.loaded);
  }
}
