import 'package:base_flutter_project/core/size_config/app_dimens.dart';
import 'package:base_flutter_project/core/size_config/size_config.dart';
import 'package:base_flutter_project/core/styles/app_text_styles.dart';
import 'package:base_flutter_project/core/themes/app_colors.dart';
import 'package:base_flutter_project/core/themes/app_themes.dart';
import 'package:base_flutter_project/shared/shared.src.dart';
import 'package:flutter/cupertino.dart';

class ButtonCustom extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final double? width;
  final Widget? startIcon;
  final Widget? endIcon;
  final Function()? onPressed;
  final BoxDecoration? buttonStyle;

  const ButtonCustom({
    super.key,
    required this.title,
    this.titleStyle,
    this.width,
    this.startIcon,
    this.endIcon,
    this.onPressed,
    this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyleBuild = titleStyle ?? AppTextStyles.style.s20.w700.blackColor;

    var buttonStyleBuild = buttonStyle ?? AppThemes.yellowButtonStyle;

    final isDisable = onPressed == null;

    return CupertinoButton(
      onPressed: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: buttonStyleBuild.copyWith(color: isDisable ? AppColors.grey : null),
        width: width ?? SizeConfig.screenWidth,
        padding: symmetric(vertical: AppDimens.d14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (startIcon != null) ...[startIcon!, width10],
            Text(title, style: titleStyleBuild),
            if (endIcon != null) ...[width10, endIcon!],
          ],
        ),
      ),
    );
  }
}
