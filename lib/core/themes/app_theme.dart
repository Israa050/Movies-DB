
import 'package:flutter/material.dart';
import 'package:movies_db/core/themes/colors/app_colors.dart';
import 'package:movies_db/core/themes/styles/text_styles.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primaryBlue,
  appBarTheme: AppBarThemeData(
    backgroundColor: AppColors.primaryBlue,
    centerTitle: true,
  ),
  iconTheme: IconThemeData(
    color: Colors.black
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    headlineMedium: TextStyles.font20WhiteBold,
    titleLarge: TextStyles.font16BlackSemiBold,
    bodyLarge: TextStyles.font14BlackRegular,
    bodyMedium: TextStyles.font12BlackRegular,
  ),
);


ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primaryBlue,
  appBarTheme: AppBarThemeData(
    backgroundColor: AppColors.darkGreen,
    titleTextStyle: TextStyle(),
    centerTitle: true,
  ),
 iconTheme: IconThemeData(
    color: Colors.white,
  ),
  scaffoldBackgroundColor:AppColors.darkBackground,
   textTheme: TextTheme(
    headlineMedium: TextStyles.font20DarkGreenBold,
    titleLarge: TextStyles.font16WhiteSemiBold,
    bodyLarge: TextStyles.font14WhiteRegular,
    bodyMedium: TextStyles.font12WhiteRegular,
  ),
);