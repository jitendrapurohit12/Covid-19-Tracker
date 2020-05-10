import 'package:covid_19/injection.dart';
import 'package:covid_19/presentation/core/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(AppWidget());
}
