import 'package:covid_19/models/image_title_model.dart';
import 'package:covid_19/styles/styles.dart';
import 'package:flutter/material.dart';

class ExpandedRowWidget extends StatelessWidget {
  final List<ImageTitleModel> list;

  const ExpandedRowWidget({Key key, this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        for (int i = 0; i < list.length; i++)
          Expanded(
            child: Container(
              height: 100,
              margin: _getMargin(index: i, length: list.length),
              padding: const EdgeInsets.all(12),
              decoration: splashProgressDecoration(
                borderColor: list[i].color,
                color: list[i].color,
                radius: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(list[i].label, style: whiteSubTitle2(context: context)),
                  Text(list[i].subtitle, style: whiteLargeTitleStyle),
                  //AnimatedNumberText(value: int.parse(list[i].subtitle)),
                ],
              ),
            ),
          )
      ],
    );
  }
}

EdgeInsetsGeometry _getMargin({@required int index, @required int length}) {
  const startMargin = EdgeInsets.fromLTRB(0, 8, 8, 8);
  const endMargin = EdgeInsets.fromLTRB(8, 8, 0, 8);
  const middleMargin = EdgeInsets.fromLTRB(8, 8, 8, 8);
  if (index == 0) {
    return startMargin;
  } else if (index == length - 1) {
    return endMargin;
  } else {
    return middleMargin;
  }
}
