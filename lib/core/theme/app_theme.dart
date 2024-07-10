import 'package:circuit_superintendent_tool/core/theme/app_colors.dart';
import 'package:circuit_superintendent_tool/core/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static get appThemeLight => ThemeData(
          appBarTheme: _appBarThemeLight,
          scaffoldBackgroundColor: AppColors.primary100,
          navigationBarTheme: _navBarThemeLight,
          cardColor: AppColors.primary200,
          shadowColor: AppColors.gray400,
          extensions: [
            AppCardTheme(
              textColor: AppColors.primary950,
              backgroundColor: AppColors.primary200,
              shadowColor: AppColors.gray400,
              inputBorderColor: AppColors.gray400,
            ),
          ]);

  static get appThemeDark => ThemeData(
          appBarTheme: _appBarThemeDark,
          scaffoldBackgroundColor: AppColors.gray950,
          navigationBarTheme: _navBarThemeDark,
          cardColor: AppColors.primary950,
          shadowColor: Colors.transparent,
          extensions: [
            AppCardTheme(
              textColor: AppColors.primary100,
              backgroundColor: AppColors.primary600.withOpacity(0.5),
              shadowColor: Colors.transparent,
              inputBorderColor: AppColors.gray400,
            ),
          ]);

  static get _appBarThemeLight => AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.primary100,
        iconTheme: IconThemeData(color: AppColors.primary950),
        actionsIconTheme: IconThemeData(color: AppColors.primary950),
        titleTextStyle: AppTextTheme.headlineSmall.copyWith(color: AppColors.primary950),
      );

  static get _appBarThemeDark => AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.primary950,
        actionsIconTheme: IconThemeData(color: AppColors.primary100),
        titleTextStyle: AppTextTheme.headlineSmall.copyWith(color: AppColors.primary100),
      );

  static get _navBarThemeLight => NavigationBarThemeData(
        iconTheme: MaterialStatePropertyAll(IconThemeData(color: AppColors.primary100)),
        backgroundColor: AppColors.primary300,
      );

  static get _navBarThemeDark => NavigationBarThemeData(
        iconTheme: MaterialStatePropertyAll(IconThemeData(color: AppColors.primary100)),
        backgroundColor: AppColors.primary950,
      );
}

class AppCardTheme extends ThemeExtension<AppCardTheme> {
  AppCardTheme({
    required this.backgroundColor,
    required this.shadowColor,
    required this.textColor,
    required this.inputBorderColor,
  });

  final Color backgroundColor;
  final Color shadowColor;
  final Color textColor;
  final Color inputBorderColor;

  @override
  ThemeExtension<AppCardTheme> copyWith({
    Color? backgroundColor,
    Color? shadowColor,
    Color? textColor,
    Color? inputBorderColor,
  }) {
    return AppCardTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      shadowColor: shadowColor ?? this.shadowColor,
      textColor: textColor ?? this.textColor,
      inputBorderColor: inputBorderColor ?? this.inputBorderColor,
    );
  }

  @override
  ThemeExtension<AppCardTheme> lerp(covariant ThemeExtension<AppCardTheme>? other, double t) {
    if (other is! AppCardTheme) {
      return this;
    }

    return AppCardTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      inputBorderColor: Color.lerp(inputBorderColor, other.inputBorderColor, t)!,
    );
  }
}
