import 'package:covid_19/styles/styles.dart';
import 'package:flutter/material.dart';

class AnimatedNumberText extends StatefulWidget {
  final int value;

  const AnimatedNumberText({Key key, @required this.value}) : super(key: key);

  @override
  _AnimatedNumberTextState createState() => _AnimatedNumberTextState();
}

class _AnimatedNumberTextState extends State<AnimatedNumberText>
    with SingleTickerProviderStateMixin {
  Tween<int> _counterTween;
  Animation<int> _counterAnimation;
  AnimationController _counterController;

  @override
  void initState() {
    super.initState();
    _counterController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _counterTween = Tween<int>(begin: 0, end: widget.value);
    _counterAnimation = _counterTween.animate(_counterController);
    _counterController.forward();
  }

  @override
  void dispose() {
    _counterController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _counterAnimation,
        builder: (congtext, _) {
          return Text(
            _counterAnimation.value.toString(),
            style: whiteLargeTitleStyle,
          );
        });
  }
}
