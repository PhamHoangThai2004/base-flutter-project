import 'package:base_flutter_project/core/data/local/app_preferences.dart';
import 'package:base_flutter_project/core/di/injection.dart';
import 'package:base_flutter_project/main/app_config.dart';
import 'package:base_flutter_project/main/my_application.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void mainCommon(Environment environment) async {
  await _configApp(environment);
  runApp(EasyLocalization(
    supportedLocales: const [Locale('vi')],
    path: 'assets/translations',
    fallbackLocale: const Locale('vi'),
    startLocale: const Locale('vi'),
    saveLocale: true,
    child: const MyApplication(),
  ));
}

Future<void> _configApp(Environment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.initialize(environment);
  await EasyLocalization.ensureInitialized();
  await AppPreferences.instance.init();
  configureDependencies();
}
