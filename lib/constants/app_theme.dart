import 'package:flutter/material.dart';
import 'package:valorant_app/constants/colors.dart';

final ThemeData themeData = ThemeData(
  brightness: Brightness.light,
  primarySwatch: MaterialColor(AppColors.red[900]!.value, AppColors.red),
  primaryColor: AppColors.red[900],
);

final ThemeData themeDataDark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.selectedTabColor,
);
