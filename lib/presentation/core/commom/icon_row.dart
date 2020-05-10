import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconRow extends StatelessWidget {
  final String path1, path2;
  final VoidCallback callback1, callback2;

  const IconRow({
    Key key,
    @required this.path1,
    @required this.path2,
    @required this.callback1,
    @required this.callback2,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        getClickableSvgIcon(
          path: path1,
          callback: callback1,
        ),
        getClickableSvgIcon(
          path: path2,
          callback: callback2,
        ),
      ],
    );
  }

  Widget getClickableSvgIcon({
    @required String path,
    @required VoidCallback callback,
  }) {
    return GestureDetector(
      onTap: callback,
      child: SvgPicture.asset(path),
    );
  }
}
