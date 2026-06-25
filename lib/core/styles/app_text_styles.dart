import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../size_config/app_dimens.dart';
import '../themes/app_colors.dart';

final class AppTextStyles {
  static TextStyle style = GoogleFonts.beVietnamPro(
    fontSize: AppDimens.d16,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
}

extension FontWeightCustom on TextStyle {
  /// FontWeight.w300 / light
  TextStyle get w300 => copyWith(fontWeight: FontWeight.w300);

  /// FontWeight.w400 / regular
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);

  /// FontWeight.w500 / medium
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);

  /// FontWeight.w600 / semi-bold
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);

  /// FontWeight.w700 / bold
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);

  /// FontWeight.w800 / heavy
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);

  /// FontWeight.w900 / black
  TextStyle get w900 => copyWith(fontWeight: FontWeight.w900);
}

extension FontSizeCustom on TextStyle {
  /// fontSize: 10
  TextStyle get s10 => copyWith(fontSize: AppDimens.d10);

  /// fontSize: 12
  TextStyle get s12 => copyWith(fontSize: AppDimens.d12);

  /// fontSize: 14
  TextStyle get s14 => copyWith(fontSize: AppDimens.d14);

  /// fontSize: 16
  TextStyle get s16 => copyWith(fontSize: AppDimens.d16);

  /// fontSize: 18
  TextStyle get s18 => copyWith(fontSize: AppDimens.d18);

  /// fontSize: 20
  TextStyle get s20 => copyWith(fontSize: AppDimens.d20);

  /// fontSize: 24
  TextStyle get s24 => copyWith(fontSize: AppDimens.d24);
}

extension FontColorCustom on TextStyle {
  /// color: white
  TextStyle get whiteColor => copyWith(color: AppColors.white);

  /// color: black
  TextStyle get blackColor => copyWith(color: AppColors.black);
}
