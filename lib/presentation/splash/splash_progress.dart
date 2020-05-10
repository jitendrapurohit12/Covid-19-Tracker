import 'package:covid_19/styles/styles.dart';
import 'package:flutter/material.dart';

class SplashProgress extends StatefulWidget {
  final double progress;

  const SplashProgress({Key key, @required this.progress}) : super(key: key);
  @override
  _SplashProgressState createState() => _SplashProgressState();
}

class _SplashProgressState extends State<SplashProgress>
    with SingleTickerProviderStateMixin {
  final double _borderWidth = 2.5;
  final double _height = 16;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double progressWidth = width / 2;
    return Stack(
      children: <Widget>[
        Container(
          height: _height,
          width: progressWidth + (2 * _borderWidth),
          decoration: splashProgressDecoration(radius: _height / 2),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.all(_borderWidth),
          height: _height - (2 * _borderWidth),
          width: widget.progress * progressWidth,
          decoration: splashProgressDecoration(
            borderColor: Colors.transparent,
            color: Colors.white70,
            radius: (_height - (2 * _borderWidth)) / 2,
          ),
        ),
      ],
    );
  }
}
