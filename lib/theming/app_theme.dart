import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobile_app_foundation/theming/index.dart';

ThemeData appTheme = ThemeData(
  fontFamily: mainFont,
  brightness: Brightness.light,
  scaffoldBackgroundColor: white,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
);

extension CustomTextTheme on TextTheme {}
