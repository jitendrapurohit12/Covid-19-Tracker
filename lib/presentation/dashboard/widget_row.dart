import 'package:covid_19/constants/constants.dart';
import 'package:covid_19/enums/notifier_state.dart';
import 'package:covid_19/notifiers/selected_country_notifier.dart';
import 'package:covid_19/presentation/screen_country_select.dart';
import 'package:covid_19/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WidgetRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(kCovid19, style: whiteLargeTitleStyle),
        Consumer<SelectedCountryNotifier>(
          builder: (_, notifier, __) {
            switch (notifier.state) {
              case NotifierState.loaded:
                return _getChip(
                  context: context,
                  label: notifier.selectedCountry.countryCode,
                );
                break;
              default:
                return _getChip(context: context);
            }
          },
        )
      ],
    );
  }
}

Widget _getChip({
  @required BuildContext context,
  String label = 'Select Country',
}) {
  return ActionChip(
    backgroundColor: Colors.white,
    label: Text(label.toUpperCase()),
    onPressed: () => Navigator.pushNamed(context, ScreenCountrySelect.id),
    avatar: Icon(Icons.flag),
  );
}
