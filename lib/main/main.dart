import 'package:base_flutter_project/main/app_config.dart';
import 'package:base_flutter_project/main/my_application.dart';
import 'package:flutter/material.dart';

void mainCommon(Environment environment) {
  AppConfig.initialize(environment);
  runApp(const MyApp());
}

