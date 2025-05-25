import 'package:flutter/material.dart';

class Dimensions {
  static late double screenWidth;
  static late double fontSizeExtraSmall;
  static late double fontSizeSmall;
  static late double fontSizeDefault;
  static late double fontSizeLarge;
  static late double fontSizeExtraLarge;
  static late double fontSizeOverLarge;

  static const double paddingSizeExtraSmall = 5.0;
  static const double paddingSizeSmall = 10.0;
  static const double paddingSizeDefault = 15.0;
  static const double paddingSizeLarge = 20.0;
  static const double paddingSizeExtraLarge = 25.0;
  static const double paddingSizeOverLarge = 30.0;

  static const double radiusSmall = 5.0;
  static const double radiusDefault = 10.0;
  static const double radiusLarge = 15.0;
  static const double radiusExtraLarge = 20.0;
  static const double radiusOverLarge = 50.0;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth <= 360) {
      fontSizeExtraSmall = 10;
      fontSizeSmall = 12;
      fontSizeDefault = 14;
      fontSizeLarge = 16;
      fontSizeExtraLarge = 18;
      fontSizeOverLarge = 20;
    } else if (screenWidth <= 430) {
      fontSizeExtraSmall = 12;
      fontSizeSmall = 14;
      fontSizeDefault = 16;
      fontSizeLarge = 18;
      fontSizeExtraLarge = 20;
      fontSizeOverLarge = 22;
    } else {
      fontSizeExtraSmall = 14;
      fontSizeSmall = 16;
      fontSizeDefault = 18;
      fontSizeLarge = 20;
      fontSizeExtraLarge = 22;
      fontSizeOverLarge = 24;
    }
  }
}
