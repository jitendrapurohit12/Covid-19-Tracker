import 'package:covid_19/constants/constants.dart';
import 'package:covid_19/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBarWidget extends StatelessWidget {
  final VoidCallback statsCallback, newsCallback, infoCallback;

  const BottomBarWidget({
    Key key,
    @required this.statsCallback,
    this.newsCallback,
    this.infoCallback,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _getClickableContainer(selected: true, path: kImageHome),
          _getClickableContainer(
            selected: false,
            path: kImageStats,
            callback: statsCallback,
          ),
          _getClickableContainer(
            selected: false,
            path: kImageNewspaper,
            callback: newsCallback,
          ),
          _getClickableContainer(
            selected: false,
            path: kImageInfo,
            callback: infoCallback,
          ),
        ],
      ),
    );
  }
}

Widget _getClickableContainer({
  @required bool selected,
  @required String path,
  VoidCallback callback,
}) {
  return InkWell(
    onTap: callback,
    borderRadius: borderRadius(24),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: splashProgressDecoration(
          color: selected ? kColorPrimary : Colors.transparent, radius: 24),
      child: SvgPicture.asset(path),
    ),
  );
}
