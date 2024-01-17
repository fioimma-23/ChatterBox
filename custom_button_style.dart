import 'dart:ui';
import 'package:chat_app/core/app_export.dart';
import 'package:flutter/material.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26.h),
        ),
      );

  // Gradient button style
  static BoxDecoration get gradientBlackToBlackDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(30.h),
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.black90001,
            appTheme.black90001,
          ],
        ),
      );
  static BoxDecoration get gradientBlackToBlackTL15Decoration => BoxDecoration(
        borderRadius: BorderRadius.circular(15.h),
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.black90001,
            appTheme.black90001,
          ],
        ),
      );
  static BoxDecoration get gradientBlueGrayToBlackDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(30.h),
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.blueGray90002,
            appTheme.black90001,
          ],
        ),
      );
  static BoxDecoration get gradientWhiteAToBlackDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(30.h),
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.whiteA700,
            appTheme.black90001,
          ],
        ),
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
