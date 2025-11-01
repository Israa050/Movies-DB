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
  iconTheme: IconThemeData(color: Colors.black),
  scaffoldBackgroundColor: Colors.white,
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStateColor.resolveWith((s) => Colors.black),
    ),
  ),
  textTheme: TextTheme(
    headlineMedium: TextStyles.font20WhiteBold,
    titleLarge: TextStyles.font16BlackSemiBold,
    bodyLarge: TextStyles.font14BlackRegular,
    bodyMedium: TextStyles.font12BlackRegular,
  ),
  extensions: [
    AppThemeExtension(
      darkContainerColor: AppColors.darkContianerBackground,
      lightContainerColor: AppColors.lightPurple,
    ),
  ],
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primaryBlue,
  appBarTheme: AppBarThemeData(
    backgroundColor: AppColors.darkGreen,
    titleTextStyle: TextStyle(),
    centerTitle: true,
  ),
  iconTheme: IconThemeData(color: Colors.white),
  scaffoldBackgroundColor: AppColors.darkBackground,
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStateColor.resolveWith((s) => Colors.white),
    ),
  ),
  textTheme: TextTheme(
    headlineMedium: TextStyles.font20WhiteBold,
    titleLarge: TextStyles.font16WhiteSemiBold,
    bodyLarge: TextStyles.font14WhiteRegular,
    bodyMedium: TextStyles.font12WhiteRegular,
  ),
  extensions: [
    AppThemeExtension(
      darkContainerColor: AppColors.darkContianerBackground,
      lightContainerColor: AppColors.lightPurple,
    ),
    ContainerThemeExtension(lightContainerColor: AppColors.inActiveButton, darkContainerColor: AppColors.darkGrey,)
  ],
);

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  // These are the colors for the light and dark themes
  final Color lightContainerColor;
  final Color darkContainerColor;

  AppThemeExtension({
    required this.lightContainerColor,
    required this.darkContainerColor,
  });

  // This method is called when you want to create a copy of the extension
  @override
  AppThemeExtension copyWith({
    Color? lightContainerColor,
    Color? darkContainerColor,
  }) {
    return AppThemeExtension(
      lightContainerColor: lightContainerColor ?? this.lightContainerColor,
      darkContainerColor: darkContainerColor ?? this.darkContainerColor,
    );
  }

  // This method is used for interpolating between themes (e.g., smooth transitions)
  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this;
    return AppThemeExtension(
      lightContainerColor: Color.lerp(
        lightContainerColor,
        other.lightContainerColor,
        t,
      )!,
      darkContainerColor: Color.lerp(
        darkContainerColor,
        other.darkContainerColor,
        t,
      )!,
    );
  }

  // This is a convenience method to get the correct color based on the current theme's brightness
  Color getContainerColor(BuildContext context) {
    // Dynamically check the current brightness
    return Theme.of(context).brightness == Brightness.dark
        ? darkContainerColor // Use dark theme color
        : lightContainerColor; // Use light theme color
  }
}

class ContainerThemeExtension extends ThemeExtension<ContainerThemeExtension> {
  // Colors for light and dark theme containers
  final Color lightContainerColor;
  final Color darkContainerColor;

  // Constructor to initialize light and dark theme colors
  ContainerThemeExtension({
    required this.lightContainerColor,
    required this.darkContainerColor,
  });

  @override
  ContainerThemeExtension copyWith({
    Color? lightContainerColor,
    Color? darkContainerColor,
  }) {
    return ContainerThemeExtension(
      lightContainerColor: lightContainerColor ?? this.lightContainerColor,
      darkContainerColor: darkContainerColor ?? this.darkContainerColor,
    );
  }

  @override
  ContainerThemeExtension lerp(ThemeExtension<ContainerThemeExtension>? other, double t) {
    if (other is! ContainerThemeExtension) return this;
    return ContainerThemeExtension(
      lightContainerColor: Color.lerp(
        lightContainerColor,
        other.lightContainerColor,
        t,
      )!,
      darkContainerColor: Color.lerp(
        darkContainerColor,
        other.darkContainerColor,
        t,
      )!,
    );
  }

  // This method will return the correct container color based on the current theme
  Color containerColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkContainerColor // Dark theme container color
        : lightContainerColor; // Light theme container color
  }
}
