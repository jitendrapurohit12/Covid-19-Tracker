import 'package:covid_19/constants/constants.dart';
import 'package:covid_19/models/image_title_model.dart';
import 'package:covid_19/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageStackWidget extends StatelessWidget {
  final ImageTitleModel model;

  const ImageStackWidget({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.all(18),
              decoration: stackImageDecoration,
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 120),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(kDoYourTest, style: whiteTitleStyle),
                        const SizedBox(height: 8),
                        Text(
                          kDoYourTestInstrucitons,
                          style: whiteBody2(context: context),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 12,
              child: SvgPicture.asset(kImageFrame),
            ),
          ],
        ),
      ],
    );
  }
}
