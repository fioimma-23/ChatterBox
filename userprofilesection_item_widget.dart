import 'package:chat_app/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserprofilesectionItemWidget extends StatelessWidget {
  const UserprofilesectionItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 11.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgCamera,
            height: 52.adaptSize,
            width: 52.adaptSize,
            radius: BorderRadius.circular(
              26.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 11.h,
              top: 3.v,
              bottom: 7.v,
            ),
            child: Column(
              children: [
                Text(
                  "Fionna",
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 3.v),
                Text(
                  "Life is beautiful 👌",
                  style: theme.textTheme.labelLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
