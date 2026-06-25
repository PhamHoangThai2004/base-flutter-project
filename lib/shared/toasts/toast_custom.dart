import 'package:base_flutter_project/core/styles/app_text_styles.dart';
import 'package:base_flutter_project/core/themes/app_colors.dart';
import 'package:base_flutter_project/generated/assets.gen.dart';
import 'package:base_flutter_project/shared/shared.src.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';

import '../../core/size_config/app_dimens.dart';

enum ToastType { success, error, info }

extension ToastTypeX on ToastType {
  Color get color {
    switch (this) {
      case ToastType.success:
        return AppColors.green;
      case ToastType.error:
        return AppColors.red;
      case ToastType.info:
        return AppColors.blue;
    }
  }
}

final class ToastCustom {
  static void show({
    ToastType type = ToastType.error,
    required String message,
    int durationMilliseconds = 3000,
  }) {
    BotToast.cleanAll();
    late CancelFunc cancel;

    cancel = BotToast.showCustomNotification(
      animationDuration: const Duration(milliseconds: 300),
      animationReverseDuration: const Duration(milliseconds: 300),
      duration: Duration(milliseconds: durationMilliseconds),
      backButtonBehavior: BackButtonBehavior.close,
      toastBuilder: (_) {
        return Container(
          margin: symmetric(horizontal: AppDimens.p20),
          padding: all(AppDimens.p12),
          decoration: BoxDecoration(
            color: type.color,
            borderRadius: borderCircular(AppDimens.r10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Assets.icons.icExclamationCircle.svg(),
                    width8,
                    Flexible(
                      child: Text(
                        message,
                        style: AppTextStyles.style.s14.w400.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
              ButtonCustom(
                onPressed: cancel,
                child: Container(
                  padding: all(AppDimens.p4),
                  child: Assets.icons.icClose.svg(width: AppDimens.p8),
                ),
              ),
            ],
          ),
        );
      },
      enableSlideOff: true,
      onlyOne: true,
      crossPage: true,
      useSafeArea: true,
    );
  }
}
