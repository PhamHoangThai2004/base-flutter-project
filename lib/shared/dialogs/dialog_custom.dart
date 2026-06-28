import 'package:base_flutter_project/core/styles/app_text_styles.dart';
import 'package:base_flutter_project/core/themes/app_colors.dart';
import 'package:base_flutter_project/core/themes/app_themes.dart';
import 'package:base_flutter_project/shared/shared.src.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../generated/assets.gen.dart';
import '../../core/size_config/app_dimens.dart';

Future<void> showDialogCustom({
  required BuildContext context,
  required String title,
  String? subTitle,
  required String message,
  required Function() acceptAction,
  String? acceptTitle,
  String? cancelTitle,
  Function()? cancelAction,
  bool isHideCancel = false,
  Widget? icon,
  bool barrierDismissible = false,
  bool isShowCloseButton = false,
}) async {
  await showDialog(
    context: context,
    barrierColor: AppColors.black.withValues(alpha: 0.5),
    barrierDismissible: barrierDismissible,
    useSafeArea: true,
    builder: (context) => _DialogCustom(
      title: title,
      subTitle: subTitle,
      message: message,
      acceptAction: acceptAction,
      acceptTitle: acceptTitle,
      isHideCancel: isHideCancel,
      cancelTitle: cancelTitle,
      cancelAction: cancelAction,
      icon: icon,
      isShowCloseButton: isShowCloseButton,
    ),
  );
}

class _DialogCustom extends StatefulWidget {
  const _DialogCustom({
    required this.title,
    this.subTitle,
    required this.message,
    required this.acceptAction,
    required this.isHideCancel,
    this.acceptTitle,
    this.cancelTitle,
    this.cancelAction,
    this.icon,
    required this.isShowCloseButton,
  });

  final String title;
  final String message;
  final String? subTitle;
  final Function() acceptAction;
  final bool isHideCancel;
  final String? acceptTitle;
  final String? cancelTitle;
  final Function()? cancelAction;
  final Widget? icon;
  final bool isShowCloseButton;

  @override
  State<StatefulWidget> createState() => _DialogCustomState();
}

class _DialogCustomState extends State<_DialogCustom> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
      child: Stack(
        children: [
          Container(
            padding: symmetric(horizontal: AppDimens.defaultPadding),
            decoration: BoxDecoration(
              color: AppColors.black.withValues(alpha: 0.8),
              borderRadius: const BorderRadius.all(Radius.circular(AppDimens.r16)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                height14,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.title, style: AppTextStyles.style.s18.w700.whiteColor),
                ),
                height12,
                widget.icon ?? Container(),
                height16,
                if (widget.subTitle != null) ...[
                  Text(
                    widget.subTitle ?? '',
                    style: AppTextStyles.style.s20.w500.whiteColor,
                    textAlign: TextAlign.center,
                  ),
                ],
                Text(
                  widget.message,
                  style: AppTextStyles.style.s16.w300.whiteColor,
                  textAlign: TextAlign.center,
                ),
                height24,
                _buildButtons(),
                height20,
              ],
            ),
          ),
          if (widget.isShowCloseButton)
            Positioned(
              top: AppDimens.d12,
              right: AppDimens.d12,
              child: CupertinoCustom(
                padding: EdgeInsets.zero,
                onPressed: () => context.pop(),
                child: Container(
                  padding: all(AppDimens.d8),
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Assets.icons.icClose.svg(
                    width: AppDimens.d12,
                    colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      spacing: AppDimens.d10,
      children: [
        if (!widget.isHideCancel) ...{
          Expanded(
            child: ButtonCustom(
              title: widget.cancelTitle ?? 'cancel'.tr(),
              titleStyle: AppTextStyles.style.w600.s18.whiteColor,
              buttonStyle: AppThemes.disabledButtonStyle,
              onPressed: () {
                context.pop();
                if (widget.cancelAction != null) {
                  widget.cancelAction!();
                }
              },
            ),
          ),
        },
        Expanded(
          child: ButtonCustom(
            title: widget.acceptTitle ?? 'accept'.tr(),
            titleStyle: AppTextStyles.style.w600.s18.blackColor,
            onPressed: () {
              widget.acceptAction();
              context.pop();
            },
          ),
        ),
      ],
    );
  }
}
