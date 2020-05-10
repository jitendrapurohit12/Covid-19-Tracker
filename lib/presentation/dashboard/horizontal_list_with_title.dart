import 'package:covid_19/models/image_title_model.dart';
import 'package:covid_19/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HorizontalListWithTile extends StatelessWidget {
  final List<ImageTitleModel> list;
  final String title;

  const HorizontalListWithTile({Key key, this.list, this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(title, style: blackHeadline6(context: context)),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 144,
          child: ListView.builder(
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SvgPicture.asset(list[index].path),
                    const SizedBox(height: 8),
                    Text(
                      list[index].label,
                      textAlign: TextAlign.center,
                      style: blackSubTitle2(context: context),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
