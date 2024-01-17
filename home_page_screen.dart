
import 'package:chat_app/core/app_export.dart';
import 'package:chat_app/presentation/login_page_screen/login_page_screen.dart';
import 'package:chat_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

import '../sign_up_screen/sign_up_screen.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [
                appTheme.black90001,
                appTheme.blueGray90004,
                theme.colorScheme.secondaryContainer,
              ],
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 59.h,
              vertical: 25.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlineGradientButton(
                  padding: EdgeInsets.all(2.h),
                  strokeWidth: 2.h,
                  gradient: LinearGradient(
                    begin: Alignment(0.1, 0),
                    end: Alignment(0.1, 1),
                    colors: [
                      appTheme.deepPurpleA700,
                      appTheme.purpleA40033,
                    ],
                  ),

                  corners: Corners(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
            child: Row(

              children: [
                Padding(
                    padding: EdgeInsets.only(top: 5.0),

               child:  CustomIconButton(
                  height: 32.adaptSize,
                  width: 32.adaptSize,
                  padding: EdgeInsets.all(7.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgVector,
                  ),
                ),
                ),
                SizedBox(width: 20.0),
                Padding
                  (padding: EdgeInsets.only(top:5.0),
                  child:Text(
                  "Chatter Box",
                  style: theme.textTheme.headlineSmall,
                ),
                ),
              ],
            ),
                ),


             Spacer(flex: 35),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 221.h,
                    margin: EdgeInsets.only(left: 19.h),
                    child: Text(
                      "Where Words Echo Safely and Securely!",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodyLargeCopseWhiteA700,
                    ),
                  ),
                ),
                SizedBox(height: 37.v),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: 19.h),
                    child: Text(
                      "Chat App for your everyday life",
                      style: CustomTextStyles.bodyMediumCormorantUprightGray400,
                    ),
                  ),
                ),
                Spacer(flex: 29),
                SizedBox(
                  width: 124.h,
                  child: Text(
                    "Tap to start Chatter Box",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.titleMediumCormorantUprightGray400,
                  ),
                ),
                SizedBox(height: 30.v),
                OutlineGradientButton(
                  padding: EdgeInsets.all(2.h),
                  strokeWidth: 2.h,
                  gradient: LinearGradient(
                    begin: Alignment(0.5, 0),
                    end: Alignment(0.5, 1),
                    colors: [
                      theme.colorScheme.primary,
                      theme.colorScheme.errorContainer,
                    ],
                  ),
                  corners: Corners(
                    topLeft: Radius.circular(44),
                    topRight: Radius.circular(44),
                    bottomLeft: Radius.circular(44),
                    bottomRight: Radius.circular(44),
                  ),
                  child: CustomIconButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPageScreen()),
                      );
                    },
                    height: 89.adaptSize,
                    width: 89.adaptSize,
                    padding: EdgeInsets.all(25.h),
                    decoration: IconButtonStyleHelper.outline,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgAnimIcon,
                    ),
                  ),
                ),
                SizedBox(height: 78.v),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(right: 22.h),
                    child: Text(
                      "©2030 chatter box. All rights reserved.",
                      style: CustomTextStyles.bodySmallGray500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
