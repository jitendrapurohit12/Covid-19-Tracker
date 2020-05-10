import 'package:covid_19/constants/constants.dart';
import 'package:covid_19/helper/ui_helper.dart';
import 'package:covid_19/models/image_title_model.dart';
import 'package:covid_19/notifiers/selected_country_notifier.dart';
import 'package:covid_19/presentation/core/commom/basic_scaffold.dart';
import 'package:covid_19/presentation/core/commom/icon_row.dart';
import 'package:covid_19/presentation/dashboard/bottom_bar_widget.dart';
import 'package:covid_19/presentation/dashboard/button_row.dart';
import 'package:covid_19/presentation/dashboard/horizontal_list_with_title.dart';
import 'package:covid_19/presentation/dashboard/image_stack_widget.dart';
import 'package:covid_19/presentation/dashboard/widget_row.dart';
import 'package:covid_19/presentation/statastics/screen_statastics.dart';
import 'package:covid_19/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenDashboard extends StatelessWidget {
  static const id = 'dashboard';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BasicScaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: size.width,
              decoration: dashboardDecoration,
              padding: const EdgeInsets.all(24),
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
                  const SizedBox(height: 42),
                  WidgetRow(),
                  const SizedBox(height: 36),
                  Text(
                    kFeelingSick,
                    style: whiteHeadline6(context: context),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    kFeelingSickDesc,
                    style: whiteBody2(context: context),
                  ),
                  const SizedBox(height: 24),
                  ButtonRow(),
                ],
              ),
            ),
            const SizedBox(height: 24),
            HorizontalListWithTile(
              list: imageTitleList,
              title: kPrevention,
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ImageStackWidget(
                model: frameModel,
              ),
            ),
          ],
        ),
      ),
      botomBar: Consumer<SelectedCountryNotifier>(
        builder: (_, notifier, __) => BottomBarWidget(
          statsCallback: () {
            if (notifier.selectedCountry != null) {
              Navigator.pushNamed(context, ScreenStatastics.id);
            } else {
              showErrorFlushbar(
                context: context,
                message: kNullCountryError,
              );
            }
          },
          infoCallback: () => showErrorFlushbar(
            context: context,
            message: kInvalidOptionError,
          ),
          newsCallback: () => showErrorFlushbar(
            context: context,
            message: kInvalidOptionError,
          ),
        ),
      ),
    );
  }
}
