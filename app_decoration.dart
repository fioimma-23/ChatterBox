import 'package:flutter/material.dart';
import 'package:chat_app/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray500,
      );
  static BoxDecoration get fillGray900 => BoxDecoration(
        color: appTheme.gray900,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillRed => BoxDecoration(
        color: appTheme.red400,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );

  // Gradient decorations
  static BoxDecoration get gradientBlackToBlueGray => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.black90001,
            appTheme.blueGray90003,
          ],
        ),
      );
  static BoxDecoration get gradientBlackToBluegray90001 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.black90001,
            appTheme.blueGray90001,
          ],
        ),
      );
  static BoxDecoration get gradientBlackToPrimary => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.black90001.withOpacity(0.3),
            theme.colorScheme.primary.withOpacity(0.3),
          ],
        ),
      );
  static BoxDecoration get gradientBlackToSecondaryContainer => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.black90001,
            appTheme.blueGray90004,
            theme.colorScheme.secondaryContainer,
          ],
        ),
      );
  static BoxDecoration get gradientDeepPurpleAToPrimaryContainer =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.deepPurpleA20033,
            theme.colorScheme.primaryContainer,
          ],
        ),
      );
  static BoxDecoration get gradientGrayToIndigo => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.gray900,
            appTheme.indigo900,
          ],
        ),
      );
  static BoxDecoration get gradientOnPrimaryContainerToPrimary => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.onPrimaryContainer,
            appTheme.blueGray900,
            theme.colorScheme.primary,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outline => BoxDecoration(
        color: appTheme.black900,
        boxShadow: [
          BoxShadow(
            color: appTheme.purpleA40033,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              10,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineWhiteA => BoxDecoration(
        color: appTheme.whiteA700.withOpacity(0.05),
        border: Border.all(
          color: appTheme.whiteA700.withOpacity(0.3),
          width: 1.h,
        ),
      );
  static BoxDecoration get outline1 => BoxDecoration(
        color: appTheme.black900.withOpacity(0.8),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onPrimary,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              10,
            ),
          ),
        ],
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder11 => BorderRadius.circular(
        11.h,
      );
  static BorderRadius get circleBorder26 => BorderRadius.circular(
        26.h,
      );
  static BorderRadius get circleBorder32 => BorderRadius.circular(
        32.h,
      );
  static BorderRadius get circleBorder60 => BorderRadius.circular(
        60.h,
      );
  static BorderRadius get circleBorder89 => BorderRadius.circular(
        89.h,
      );

  // Custom borders
  static BorderRadius get customBorderBL40 => BorderRadius.vertical(
        bottom: Radius.circular(40.h),
      );
  static BorderRadius get customBorderTL40 => BorderRadius.vertical(
        top: Radius.circular(40.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder1 => BorderRadius.circular(
        1.h,
      );
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.h,
      );
  static BorderRadius get roundedBorder23 => BorderRadius.circular(
        23.h,
      );
  static BorderRadius get roundedBorder44 => BorderRadius.circular(
        44.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
