import 'package:covid_19/constants/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageTitleModel {
  String path, label, subtitle;
  Color color;

  ImageTitleModel({
    @required this.path,
    @required this.label,
    this.subtitle,
    this.color,
  });
}

List<ImageTitleModel> imageTitleList = [
  ImageTitleModel(
    path: kImagePrecaution1,
    label: kPrecaution1,
  ),
  ImageTitleModel(
    path: kImagePrecaution2,
    label: kPrecaution2,
  ),
  ImageTitleModel(
    path: kImagePrecaution3,
    label: kPrecaution3,
  ),
];

ImageTitleModel frameModel = ImageTitleModel(
  label: kDoYourTest,
  path: kImageFrame,
  subtitle: kDoYourTestInstrucitons,
);
