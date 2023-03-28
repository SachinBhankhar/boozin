import 'package:flutter/material.dart';

class ImagePathDark implements ImagePath {
  @override
  String get splashBoozin => "assets/images/splash/dark/booz_n.png";
  @override
  String get iconSteps => "assets/images/step.svg";
  @override
  String get iconKcal => "assets/images/kcal.svg";
}

class ImagePathLight implements ImagePath {
  @override
  String get splashBoozin => "assets/images/splash/light/booz_n.png";
  @override
  String get iconSteps => "assets/images/step.svg";
  @override
  String get iconKcal => "assets/images/kcal.svg";
}

class ImagePathCommon {
  static const String splashI = "assets/images/splash/common.png";
}

abstract class ImagePath {
  String get splashBoozin;
  String get iconSteps;
  String get iconKcal;

  factory ImagePath(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? ImagePathLight()
          : ImagePathDark();
}
