import 'dart:io';
import 'dart:ui';
import 'dart:isolate';




import 'package:chat_app/presentation/invite_screen/widgets/contactlist_item_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../setting_page_bottomsheet/widgets/accountlist_item_widget.dart';
import 'package:chat_app/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/presentation/security_page_bottomsheet/security_page_bottomsheet.dart';
import 'package:chat_app/presentation/user_profile_bottomsheet/user_profile_bottomsheet.dart';
import 'package:chat_app/presentation/invite_screen/invite_screen.dart';
import 'package:chat_app/presentation/new_chatroom_screen/new_chatroom_screen.dart';
import 'package:chat_app/presentation/new_contact_screen/new_contact_screen.dart';
import 'package:chat_app/presentation/notification_page_bottomsheet/notification_page_bottomsheet.dart';
import 'package:chat_app/presentation/user_guide_bottomsheet/user_guide_bottomsheet.dart';
import 'package:file_picker/file_picker.dart';

class SettingPageBottomsheet extends StatelessWidget {
  SettingPageBottomsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 359.h,
        padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 19.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 3.v,
                width: 30.h,
                decoration: BoxDecoration(
                  color: appTheme.black90001,
                  borderRadius: BorderRadius.circular(1.h),
                ),
              ),
            ),
            SizedBox(height: 21.v),
            Container(
              height: 73.v,
              width: 234.h,
              margin: EdgeInsets.only(left: 9.h),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 91.h,
                      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 1.v),
                      decoration: AppDecoration.outlineWhiteA.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder16,
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(left: 33.h, top: 25.v),
                      child: Text(
                       // fetchData();
                        "Fionna",
                        textAlign: TextAlign.left,
                         style: TextStyle(
                        color: appTheme.black900,
                        fontSize: 16.fSize,
                        fontFamily: 'Chivo',
                        fontWeight: FontWeight.bold,
                      ),
                           // Align the text to the left

                      ),

                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        onTapNameText(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 15.v),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgCamera,
                              height: 30.v,
                              width: 28.h,
                              radius: BorderRadius.circular(28.h),
                              margin: EdgeInsets.only(bottom: 9.v),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 33.h, top: 25.v),
                              child: Text(
                                "Never give up 💪",
                                style: TextStyle(
                                  color: appTheme.black90001,
                                  fontSize: 16.fSize,
                                  fontFamily: 'Chivo',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 32.v,
                      width: 173.h,
                      decoration: BoxDecoration(
                        color: appTheme.whiteA700.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(16.h),
                        border: Border.all(
                          color: appTheme.whiteA700.withOpacity(0.3),
                          width: 1.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 47.v),
            _buildAccountList(context),
            SizedBox(height: 80.v),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 95.h),
      child: AccountlistItemWidget(),
    );
  }



  onTapSecurityText(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => SecurityPageBottomsheet(),
        isScrollControlled: true);
  }


  onTapNameText(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => UserProfileBottomsheet(),
        isScrollControlled: true);
  }
   onTapChatRoomText(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => NewChatroomScreen(),
        isScrollControlled: true);
  }
   onTapNotificationsText(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => NotificationPageBottomsheet(),
        isScrollControlled: true);
  }
    onTapHelpText(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (_) => UserGuideBottomsheet(),
          isScrollControlled: true);
    }
    onTapAddContactText(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (_) => NewContactScreen(),
          isScrollControlled: true);
    }
  onTagInviteAFriendText(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => MyHomePage(),
        isScrollControlled: true);
  }
  

}


