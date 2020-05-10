import 'package:covid_19/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RoundedButton extends StatelessWidget {
  final String label, icon;
  final VoidCallback callback;
  final Color color;

  const RoundedButton({
    Key key,
    @required this.label,
    @required this.icon,
    @required this.callback,
    @required this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      padding: const EdgeInsets.symmetric(vertical: 12),
      onPressed: callback,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      label: Text(label, style: whiteButtonTextStyle),
      icon: icon != null
          ? SvgPicture.asset(icon)
          : Icon(
              Icons.restore,
              color: Colors.white,
            ),
      color: color,
    );
  }
}
