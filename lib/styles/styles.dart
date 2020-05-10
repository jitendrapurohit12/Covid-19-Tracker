import 'package:covid_19/constants/constants.dart';
import 'package:flutter/material.dart';

// Text Styles
//used for "Covid-19", "All counts"
TextStyle whiteLargeTitleStyle =
    TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white);

//used for "Prevention", "Daily New Cases"
TextStyle blackHeadline6({@required BuildContext context}) =>
    Theme.of(context).textTheme.headline6.copyWith(
          fontWeight: FontWeight.bold,
        );

//used for "are you feeling sick?", "Statistics"
TextStyle whiteHeadline6({@required BuildContext context}) =>
    blackHeadline6(context: context).copyWith(color: Colors.white);

//used for "Precautions", "My Country"
TextStyle blackSubTitle2({@required BuildContext context}) =>
    Theme.of(context).textTheme.subtitle2.copyWith(fontWeight: FontWeight.w600);

///used for "Global", "Total","Affected", "Death", "Recovered",
///"Active", "Serious"
TextStyle whiteSubTitle2({@required BuildContext context}) =>
    blackSubTitle2(context: context).copyWith(color: Colors.white);

//used for "Today", "Tomorrow"
TextStyle graySubTitle2({@required BuildContext context}) =>
    blackSubTitle2(context: context).copyWith(color: Colors.grey);

///used for "Do your own test!"
TextStyle whiteTitleStyle = whiteLargeTitleStyle.copyWith(
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

TextStyle whiteBody2({@required BuildContext context}) =>
    Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white);

TextStyle whiteButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

//common
BorderRadius borderRadius(double radius) => BorderRadius.circular(radius);

//container styles
BoxDecoration splashProgressDecoration({
  Color color = Colors.transparent,
  double radius = 8.0,
  Color borderColor = Colors.white,
}) =>
    BoxDecoration(
      borderRadius: borderRadius(radius),
      border: Border.all(color: borderColor, width: 1),
      color: color,
    );

//dashboard style
BoxDecoration dashboardDecoration = const BoxDecoration(
  color: kColorPrimary,
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(36),
    bottomRight: Radius.circular(36),
  ),
);

//stack image style
BoxDecoration stackImageDecoration = BoxDecoration(
    gradient: kFrameGradient, borderRadius: BorderRadius.circular(16));

// Stats style
BoxDecoration statsDecoration = const BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(36),
    topRight: Radius.circular(36),
  ),
);
