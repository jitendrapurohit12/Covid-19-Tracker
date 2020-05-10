import 'package:covid_19/constants/constants.dart';
import 'package:covid_19/enums/notifier_state.dart';
import 'package:covid_19/helper/ui_helper.dart';
import 'package:covid_19/notifiers/covid_notifier.dart';
import 'package:covid_19/presentation/core/commom/basic_scaffold.dart';
import 'package:covid_19/presentation/core/commom/rounded_button.dart';
import 'package:covid_19/presentation/dashboard/screen_dashboard.dart';
import 'package:covid_19/presentation/splash/splash_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ScreenSplash extends StatelessWidget {
  static const id = 'splash';
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BasicScaffold(
      color: kColorPrimary,
      body: Column(
        children: <Widget>[
          Expanded(child: Container()),
          SvgPicture.asset(kImageFrame, width: 200, height: 200),
          const SizedBox(height: 24),
          Consumer<CovidNotifier>(
            builder: (_, covidNotifier, __) {
              if (covidNotifier.state == NotifierState.initial) {
                _fetchCovidData(context: context, covidNotifier: covidNotifier);
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SplashProgress(
                    progress: _getProgress(
                      context: context,
                      covidNotifier: covidNotifier,
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (covidNotifier.state == NotifierState.error)
                    SizedBox(
                      width: width / 2,
                      child: RoundedButton(
                        color: kColorCardAmber,
                        callback: () => _fetchCovidData(
                            context: context, covidNotifier: covidNotifier),
                        icon: null,
                        label: 'RETRY',
                      ),
                    )
                  else
                    Container(),
                ],
              );
            },
          ),
          Expanded(flex: 2, child: Container()),
        ],
      ),
    );
  }
}

void _fetchCovidData({
  @required BuildContext context,
  @required CovidNotifier covidNotifier,
}) {
  covidNotifier.getCovidData(
    (val) => showErrorFlushbar(
      context: context,
      message: val.message,
    ),
  );
}

double _getProgress({
  @required BuildContext context,
  @required CovidNotifier covidNotifier,
}) {
  if (covidNotifier.state == NotifierState.loaded) {
    _prepareForDashboard(context: context);
    return 1.0;
  } else {
    return 0.0;
  }
}

Future<void> _prepareForDashboard({@required BuildContext context}) async {
  await Future.delayed(const Duration(seconds: 1));
  Navigator.pushNamed(context, ScreenDashboard.id);
}
