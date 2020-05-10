import 'package:covid_19/constants/constants.dart';
import 'package:covid_19/notifiers/country_or_global_notifier.dart';
import 'package:covid_19/notifiers/covid_notifier.dart';
import 'package:covid_19/notifiers/selected_country_notifier.dart';
import 'package:covid_19/presentation/dashboard/screen_dashboard.dart';
import 'package:covid_19/presentation/screen_country_select.dart';
import 'package:covid_19/presentation/splash/screen_splash.dart';
import 'package:covid_19/presentation/statastics/screen_statastics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CovidNotifier>(
          create: (_) => CovidNotifier(),
        ),
        ChangeNotifierProvider<SelectedCountryNotifier>(
          create: (_) => SelectedCountryNotifier(),
        ),
        ChangeNotifierProvider<CountryOrGlobalNotifier>(
          create: (_) => CountryOrGlobalNotifier(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Varela',
          primaryColor: kColorPrimary,
        ),
        initialRoute: ScreenSplash.id,
        routes: {
          ScreenSplash.id: (_) => ScreenSplash(),
          ScreenDashboard.id: (_) => ScreenDashboard(),
          ScreenCountrySelect.id: (_) => ScreenCountrySelect(),
          ScreenStatastics.id: (_) => ScreenStatastics(),
        },
      ),
    );
  }
}
