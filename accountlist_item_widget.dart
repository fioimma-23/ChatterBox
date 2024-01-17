import 'package:chat_app/core/app_export.dart';
import 'package:chat_app/presentation/invite_screen/invite_screen.dart';
import 'package:chat_app/presentation/invite_screen/widgets/contactlist_item_widget.dart';
import 'package:chat_app/presentation/new_chatroom_screen/new_chatroom_screen.dart';
import 'package:chat_app/presentation/new_contact_screen/new_contact_screen.dart';
import 'package:chat_app/presentation/notification_page_bottomsheet/notification_page_bottomsheet.dart';
import 'package:chat_app/presentation/user_guide_bottomsheet/user_guide_bottomsheet.dart';
import 'package:chat_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';

import '../../security_page_bottomsheet/security_page_bottomsheet.dart';


class AccountlistItemWidget extends StatelessWidget {
  final VoidCallback? onTapSecurityText;
  final VoidCallback? onTapChatRoomText;
  final VoidCallback? onTapNotificationsText;
  final VoidCallback? onTapHelpText;
  final VoidCallback? onTapAddContactText;
  final VoidCallback? onTapInviteAFriendText;


  AccountlistItemWidget({
    Key? key,
    this.onTapSecurityText,
    this.onTapChatRoomText,
    this.onTapNotificationsText,
    this.onTapHelpText,
    this.onTapAddContactText,
    this.onTapInviteAFriendText,
  }) : super(
          key: key
        );


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
    mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        CustomIconButton(
          height: 44.adaptSize,
          width: 44.adaptSize,
          padding: EdgeInsets.all(10.h),
          child: CustomImageView(

            imagePath: ImageConstant.imgSettings,
          ),
        ),
        GestureDetector(
          onTap: () {
            // onTapSecurityText!.call();
            onTapSecurity(context);
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 4.v,
              bottom: 2.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 5.v),
                Text(
                  "Security",
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(height: 1.v),
                Text(
                  "Privacy, security",
                  style: CustomTextStyles.bodySmallGray60001,
                ),
              ],
            ),

          ),
        ),
        ],
        ),
    // const Gap(10),
    Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
        CustomIconButton(

          height: 44.adaptSize,
          width: 44.adaptSize,
          padding: EdgeInsets.all(10.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgSettingsGray60001,
          ),
        ),
        GestureDetector(
          onTap: (){
            // onTapChatRoomText!.call();
            onTapChatRoom(context);
          },

          child: Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 6.v,
              bottom: 2.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Chat Room",
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(height: 1.v),
                Text(
                  "Add New Chat Room",
                  style: CustomTextStyles.bodySmallGray60001,
                ),
              ],
            ),

          ),

        ),
        ],
    ),
        Row(
        mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
        CustomIconButton(

          height: 44.adaptSize,
          width: 44.adaptSize,
          padding: EdgeInsets.all(10.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgNotification,
          ),
        ),
        GestureDetector(
          onTap: () {
            // onTapNotificationsText!.call();
            onTapNotifications(context);
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 8.v,
              bottom: 2.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Notifications",
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(height: 1.v),
                Text(
                  "Messages, group and others",
                  style: CustomTextStyles.bodySmallGray60001,
                ),
              ],
            ),

          ),
        ),
        ],
        ),
        Row(
        mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
        CustomIconButton(

          height: 44.adaptSize,
          width: 44.adaptSize,
          padding: EdgeInsets.all(10.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgHelp,
          ),
        ),
        GestureDetector(
          onTap: () {
            // onTapHelpText!.call();
            onTapHelp(context);
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 10.v,
              bottom: 2.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Help",
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(height: 1.v),
                Text(
                  "User Guide",
                  style: CustomTextStyles.bodySmallGray60001,
                ),
              ],
            ),

          ),

        ),
        ],
        ),
        Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        CustomIconButton(

          height: 44.adaptSize,
          width: 44.adaptSize,
          padding: EdgeInsets.all(10.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgUserGray60001,
          ),
        ),
        GestureDetector(
          onTap: () {
            onTapAddContact(context);
            // onTapAddContactText!.call();
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 12.v,
              bottom: 2.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add Contact",
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(height: 1.v),
                Text(
                  "Add Contacts,My contacts",
                  style: CustomTextStyles.bodySmallGray60001,
                ),
              ],
            ),

          ),

        ),
        ],
        ),
        Row(
        mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
        CustomIconButton(

          height: 44.adaptSize,
          width: 44.adaptSize,
          padding: EdgeInsets.all(10.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgUsers,
          ),
        ),
        GestureDetector(
          onTap: () {
            onTapInviteAFriend(context);
            // onTapInviteAFriendText!.call();
          },

          child: Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 14.v,
              bottom: 2.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Invite a friend",
                  style: theme.textTheme.bodyLarge,
                ),
              ],
            ),

          ),

        ),
    ],
        ),

      ],
    );
  }
  onTapSecurity(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => SecurityPageBottomsheet(),
        isScrollControlled: true);
  }


  // onTapProfile(BuildContext context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (_) => UserProfileBottomsheet(),
  //       isScrollControlled: true);
  // }
  onTapChatRoom(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => NewChatroomScreen(),
        isScrollControlled: true);
  }
  onTapNotifications(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => NotificationPageBottomsheet(),
        isScrollControlled: true);
  }
  onTapHelp(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => UserGuideBottomsheet(),
        isScrollControlled: true);
  }
  onTapAddContact(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => NewContactScreen(),
        isScrollControlled: true);
  }
  onTapInviteAFriend(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => MyHomePage(),
        isScrollControlled: true);
  }
}
