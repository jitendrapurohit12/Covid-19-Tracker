import 'package:covid_19/constants/constants.dart';
import 'package:covid_19/models/covid_model.dart';
import 'package:covid_19/models/image_title_model.dart';
import 'package:covid_19/notifiers/country_or_global_notifier.dart';
import 'package:covid_19/notifiers/covid_notifier.dart';
import 'package:covid_19/notifiers/selected_country_notifier.dart';
import 'package:covid_19/presentation/core/commom/basic_scaffold.dart';
import 'package:covid_19/presentation/core/commom/icon_row.dart';
import 'package:covid_19/presentation/statastics/expanded_row_widget.dart';
import 'package:covid_19/presentation/statastics/page_indicator.dart';
import 'package:covid_19/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenStatastics extends StatelessWidget {
  static const id = 'stats';
  @override
  Widget build(BuildContext context) {
    final covidData = Provider.of<CovidNotifier>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return BasicScaffold(
      color: kColorPrimary,
      body: Consumer<SelectedCountryNotifier>(
        builder: (_, selectedCountryNotifier, __) =>
            Consumer<CountryOrGlobalNotifier>(
          builder: (_, cOrGNotifier, __) => _getUI(
            cOrGNotifier: cOrGNotifier,
            size: size,
            context: context,
            covidModel: covidData.model,
            country: selectedCountryNotifier.selectedCountry,
          ),
        ),
      ),
    );
  }

  Widget _getUI({
    @required CountryOrGlobalNotifier cOrGNotifier,
    @required Size size,
    @required BuildContext context,
    @required CovidModel covidModel,
    @required Countries country,
  }) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16),
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 36),
              IconRow(
                path1: kImageMenu,
                path2: kImageNotification,
                callback1: () {},
                callback2: () {},
              ),
              const SizedBox(height: 36),
              Text(
                kStatistics,
                style: whiteHeadline6(context: context),
              ),
              const SizedBox(height: 36),
              PageIndicator(
                myCountryCallback: () =>
                    cOrGNotifier.setGlobalSelected(value: false),
                globalCallback: () =>
                    cOrGNotifier.setGlobalSelected(value: true),
                isGLobalSelected: cOrGNotifier.isGlobalSelected,
              ),
              const SizedBox(height: 24),
              ExpandedRowWidget(
                list: _getCountryRowList(
                  country: country,
                  global: covidModel.global,
                  isGLobalSelected: cOrGNotifier.isGlobalSelected,
                ),
              ),
              ExpandedRowWidget(
                list: _getCountryRowList(
                  country: country,
                  isTopList: false,
                  global: covidModel.global,
                  isGLobalSelected: cOrGNotifier.isGlobalSelected,
                ),
              ),
              const SizedBox(height: 36),
            ],
          ),
        ),
      ],
    );
  }
}

List<ImageTitleModel> _getCountryRowList({
  Countries country,
  Global global,
  bool isTopList = true,
  bool isGLobalSelected = true,
}) {
  int affected = 0, death = 0, recovered = 0, active = 0;

  if (isGLobalSelected) {
    affected = global.totalConfirmed;
    death = global.totalDeaths;
    recovered = global.totalRecovered;
    active = affected - death - recovered;
  } else {
    affected = country.totalConfirmed;
    death = country.totalDeaths;
    recovered = country.totalRecovered;
    active = affected - death - recovered;
  }
  List<ImageTitleModel> output = [];

  if (isTopList) {
    output = [
      ImageTitleModel(
        path: null,
        label: kAffected,
        color: kColorCardAmber,
        subtitle: affected.toString(),
      ),
      ImageTitleModel(
        path: null,
        label: kDeath,
        color: kColorCardRed,
        subtitle: death.toString(),
      )
    ];
  } else {
    output = [
      ImageTitleModel(
        path: null,
        label: kRecovered,
        color: kColorCardGreen,
        subtitle: recovered.toString(),
      ),
      ImageTitleModel(
        path: null,
        label: kActive,
        color: kColorCardBlue,
        subtitle: active.toString(),
      )
    ];
  }

  return output;
}
