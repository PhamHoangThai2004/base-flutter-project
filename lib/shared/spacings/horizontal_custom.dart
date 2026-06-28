import 'package:base_flutter_project/core/size_config/app_dimens.dart';
import 'package:flutter/cupertino.dart';

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({super.key, this.width = AppDimens.d8});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}

Widget width2 = const HorizontalSpace(width: AppDimens.d2);
Widget width4 = const HorizontalSpace(width: AppDimens.d4);
Widget width8 = const HorizontalSpace(width: AppDimens.d8);
Widget width10 = const HorizontalSpace(width: AppDimens.d10);
