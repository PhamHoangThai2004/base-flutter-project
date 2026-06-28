import 'package:base_flutter_project/core/routers/app_navigation.dart';
import 'package:base_flutter_project/core/size_config/app_dimens.dart';
import 'package:base_flutter_project/core/themes/app_colors.dart';
import 'package:base_flutter_project/shared/spacings/border_custom.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    context.go(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      child: Center(
        child: ClipRRect(
          borderRadius: borderAll(AppDimens.r8),
          child: Container()
        ),
      ),
    );
  }
}
