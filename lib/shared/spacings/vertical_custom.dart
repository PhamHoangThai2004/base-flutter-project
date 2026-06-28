import 'package:base_flutter_project/core/size_config/app_dimens.dart';
import 'package:flutter/cupertino.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace({super.key, this.height = AppDimens.d8});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

Widget height2 = const VerticalSpace(height: AppDimens.d2);
Widget height4 = const VerticalSpace(height: AppDimens.d4);
Widget height8 = const VerticalSpace(height: AppDimens.d8);
Widget height12 = const VerticalSpace(height: AppDimens.d12);
Widget height14 = const VerticalSpace(height: AppDimens.d14);
Widget height16 = const VerticalSpace(height: AppDimens.d16);
Widget height20 = const VerticalSpace(height: AppDimens.d20);
Widget height24 = const VerticalSpace(height: AppDimens.d24);
