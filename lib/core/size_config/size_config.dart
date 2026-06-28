import 'app_dimens.dart';
import 'package:flutter/material.dart';

/// Make sure you need to call [SizeConfig.init(context)]
/// on your starting screen
class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double screenWidth = 0;
  static double screenHeight = 0;
  static Size? appBarSize;
  static double paddingTop = 0; // Height safe area top
  static double paddingBottom = 0; // Height safe area top

  static double? bottomNavigationBarHeight;
  static double appDefaultPadding = AppDimens.d16;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    paddingTop = _mediaQueryData!.padding.top;
    paddingBottom = _mediaQueryData!.padding.bottom;
    appBarSize = const Size.fromHeight(kToolbarHeight);
    bottomNavigationBarHeight = kBottomNavigationBarHeight;
  }

  static double getSpaceWithAppBarHeight() {
    return SizeConfig.paddingTop <= 50 ? AppDimens.d8 : 0;
  }
}

