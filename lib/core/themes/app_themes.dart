import 'package:base_flutter_project/core/size_config/app_dimens.dart';
import 'package:base_flutter_project/core/themes/app_colors.dart';
import 'package:base_flutter_project/shared/shared.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppThemes {
  static ThemeData themData = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  static BoxDecoration yellowButtonStyle = BoxDecoration(
    color: AppColors.yellow,
    borderRadius: borderAll(AppDimens.r64),
  );

  static BoxDecoration disabledButtonStyle = BoxDecoration(
    color: AppColors.grey,
    borderRadius: borderAll(AppDimens.r64),
  );

  static BoxDecoration outlineButtonStyle = BoxDecoration(
    color: AppColors.transparent,
    border: Border.all(color: AppColors.yellow, width: AppDimens.d1),
    borderRadius: borderAll(AppDimens.r64),
  );

  static OutlineInputBorder inputDefaultBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.transparent),
    borderRadius: borderAll(AppDimens.r16),
  );

  static OutlineInputBorder inputErrorBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.red),
    borderRadius: borderAll(AppDimens.r16),
  );

  static OutlineInputBorder inputFocusedBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.yellow),
    borderRadius: borderAll(AppDimens.r16),
  );
}
