import 'package:base_flutter_project/core/routers/app_navigation.dart';
import 'package:base_flutter_project/core/size_config/device_size.dart';
import 'package:base_flutter_project/core/size_config/size_config.dart';
import 'package:base_flutter_project/core/themes/app_themes.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApplication extends StatefulWidget {
  const MyApplication({super.key});

  @override
  State<MyApplication> createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {
  @override
  Widget build(BuildContext context) {
   SizeConfig().init(context);
    return ScreenUtilInit(
      designSize: const Size(
        DeviceSize.designDeviceWidth,
        DeviceSize.designDeviceHeight,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppThemes.themData,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routerConfig: AppNavigation.router,
          builder: BotToastInit(),
        );
      },
    );
  }
}