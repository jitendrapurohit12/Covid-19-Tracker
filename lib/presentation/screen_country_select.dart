import 'package:covid_19/constants/constants.dart';
import 'package:covid_19/notifiers/covid_notifier.dart';
import 'package:covid_19/notifiers/selected_country_notifier.dart';
import 'package:covid_19/presentation/core/commom/basic_scaffold.dart';
import 'package:covid_19/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenCountrySelect extends StatelessWidget {
  static const id = 'country_select';
  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      color: kColorPrimary,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 76),
              Text(kSelectCountry, style: whiteHeadline6(context: context)),
              const SizedBox(height: 48),
              Consumer<CovidNotifier>(
                builder: (_, notifier, __) => Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 8,
                  children: notifier.model.countries
                      .map((e) => Consumer<SelectedCountryNotifier>(
                            builder: (_, notifier, __) => ActionChip(
                              label: Text(e.country),
                              avatar: Icon(Icons.flag),
                              onPressed: () {
                                notifier.setSelectedFlag(e);
                                Navigator.pop(context);
                              },
                            ),
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
