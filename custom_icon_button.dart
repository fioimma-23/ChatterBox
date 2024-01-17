import 'package:chat_app/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
    this.onPressed,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            height: height ?? 0,
            width: width ?? 0,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  color: appTheme.gray100,
                  borderRadius: BorderRadius.circular(22.h),
                ),
            child: child,
          ),
          onPressed: onTap,
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get outline => BoxDecoration(
        color: appTheme.black900,
        borderRadius: BorderRadius.circular(44.h),
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
  static BoxDecoration get outlineGray => BoxDecoration(
        color: theme.colorScheme.onErrorContainer,
        borderRadius: BorderRadius.circular(22.h),
        border: Border.all(
          color: appTheme.gray800,
          width: 1.h,
        ),
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray50,
      );
  static BoxDecoration get outlineTL27 => BoxDecoration(
        color: appTheme.black900,
        borderRadius: BorderRadius.circular(27.h),
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


}
