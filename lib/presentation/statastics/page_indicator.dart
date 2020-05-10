import 'package:covid_19/constants/constants.dart';
import 'package:covid_19/styles/styles.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final VoidCallback myCountryCallback, globalCallback;
  final bool isGLobalSelected;

  const PageIndicator({
    Key key,
    this.isGLobalSelected = false,
    @required this.myCountryCallback,
    @required this.globalCallback,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double outerWidth = size.width - (16 * 2);
    const outerHeight = 50.0;
    const paddingBetweenOuterAndInnerUI = 4.0;
    final double innerWidth =
        (outerWidth - (2 * paddingBetweenOuterAndInnerUI)) / 2;
    const innerHeight = outerHeight - (2 * paddingBetweenOuterAndInnerUI);
    const outerRadius = outerHeight / 2;
    const innerRadius = (outerHeight - paddingBetweenOuterAndInnerUI) / 2;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: outerWidth,
          height: outerHeight,
          decoration: splashProgressDecoration(
            color: Colors.white38,
            radius: outerRadius,
            borderColor: Colors.white38,
          ),
        ),
        AnimatedAlign(
          duration: const Duration(milliseconds: 500),
          alignment:
              isGLobalSelected ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.all(paddingBetweenOuterAndInnerUI),
            width: innerWidth,
            height: innerHeight,
            decoration: splashProgressDecoration(
              color: Colors.white,
              radius: innerRadius,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: _getTitle(
                label: kMyCountry,
                style: isGLobalSelected
                    ? whiteSubTitle2(context: context)
                    : blackSubTitle2(context: context),
                callback: myCountryCallback,
              ),
            ),
            Expanded(
              child: _getTitle(
                label: kGlobal,
                style: isGLobalSelected
                    ? blackSubTitle2(context: context)
                    : whiteSubTitle2(context: context),
                callback: globalCallback,
              ),
            ),
          ],
        )
      ],
    );
  }
}

Widget _getTitle({
  @required String label,
  @required TextStyle style,
  @required VoidCallback callback,
}) {
  return GestureDetector(
    onTap: callback,
    child: Text(
      label,
      textAlign: TextAlign.center,
      style: style,
    ),
  );
}
