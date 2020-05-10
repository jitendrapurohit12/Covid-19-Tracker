import 'package:covid_19/constants/constants.dart';
import 'package:covid_19/presentation/core/commom/rounded_button.dart';
import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RoundedButton(
            label: kCallNow,
            icon: kImagePhone,
            callback: () {},
            color: kColorRed,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: RoundedButton(
            label: kMessage,
            icon: kImageMessage,
            callback: () {},
            color: kColorBlue,
          ),
        )
      ],
    );
  }
}
