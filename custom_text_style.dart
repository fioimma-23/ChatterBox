import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLarge18 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 18.fSize,
      );
  static get bodyLargeAdaminaWhiteA700 =>
      theme.textTheme.bodyLarge!.adamina.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyLargeBlack90001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black90001,
      );
  static get bodyLargeComfortaaWhiteA700 =>
      theme.textTheme.bodyLarge!.comfortaa.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyLargeCopseWhiteA700 =>
      theme.textTheme.bodyLarge!.copse.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyLargeCroissantOneBlack90001 =>
      theme.textTheme.bodyLarge!.croissantOne.copyWith(
        color: appTheme.black90001,
      );
  static get bodyLargeGray500 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray500,
      );
  static get bodyLargeWhiteA700 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyLargeWhiteA700_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMedium15 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 15.fSize,
      );
  static get bodyMediumBlack90001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black90001,
      );
  static get bodyMediumCormorantUprightGray400 =>
      theme.textTheme.bodyMedium!.cormorantUpright.copyWith(
        color: appTheme.gray400,
        fontSize: 13.fSize,
      );
  static get bodyMediumGray900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray900,
      );
  static get bodyMediumInterBlack90001 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.black90001,
      );
  static get bodyMediumInterWhiteA700 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMediumWhiteA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMediumWhiteA700_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodySmall11 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 11.fSize,
      );
  static get bodySmall11_1 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 11.fSize,
      );
  static get bodySmallGray500 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray500,
      );
  static get bodySmallGray60001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray60001,
      );
  static get bodySmallWhiteA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 10.fSize,
      );
  static get bodySmallWhiteA700_1 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900.withOpacity(0.5),
      );
  // Headline style
  static get headlineLargeConstantia =>
      theme.textTheme.headlineLarge!.constantia;
  static get headlineLargeConstantiaBold =>
      theme.textTheme.headlineLarge!.constantia.copyWith(
        fontWeight: FontWeight.w700,
      );
  // Label text style
  static get labelLargeGray600 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray600,
      );
  static get labelLargeMulishWhiteA700 =>
      theme.textTheme.labelLarge!.mulish.copyWith(
        color: appTheme.whiteA700,
        fontSize: 13.fSize,
      );
  static get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  // Title text style
  static get titleLargeGray60001 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray60001,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeGray60001Regular => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray60001,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeRobotoPrimary =>
      theme.textTheme.titleLarge!.roboto.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleLargeWhiteA700Regular => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w400,
      );
  static get titleMediumBluegray100 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray100,
        fontSize: 16.fSize,
      );
  static get titleMediumCormorantUprightGray400 =>
      theme.textTheme.titleMedium!.cormorantUpright.copyWith(
        color: appTheme.gray400,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumMulishGray50 =>
      theme.textTheme.titleMedium!.mulish.copyWith(
        color: appTheme.gray50,
        fontSize: 16.fSize,
      );
  static get titleMediumMulishPrimary =>
      theme.textTheme.titleMedium!.mulish.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 16.fSize,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 16.fSize,
      );
}

extension on TextStyle {
  TextStyle get constantia {
    return copyWith(
      fontFamily: 'Constantia',
    );
  }

  TextStyle get adamina {
    return copyWith(
      fontFamily: 'Adamina',
    );
  }

  TextStyle get cormorantUpright {
    return copyWith(
      fontFamily: 'Cormorant Upright',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get mulish {
    return copyWith(
      fontFamily: 'Mulish',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get croissantOne {
    return copyWith(
      fontFamily: 'Croissant One',
    );
  }

  TextStyle get comfortaa {
    return copyWith(
      fontFamily: 'Comfortaa',
    );
  }

  TextStyle get copse {
    return copyWith(
      fontFamily: 'Copse',
    );
  }

  TextStyle get chivo {
    return copyWith(
      fontFamily: 'Chivo',
    );
  }
}
