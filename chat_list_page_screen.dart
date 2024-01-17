import 'package:chat_app/presentation/chat_list_page_screen/widgets/contact_list.dart';
import 'package:chat_app/presentation/chat_window_screen/chat_window_screen.dart';
import 'package:chat_app/presentation/home_page_screen/home_page_screen.dart';
// import 'package:chat_app/presentation/new_chatroom_screen/chatroom_list.dart';
import '../chat_list_page_screen/widgets/contact_list.dart';
import 'package:chat_app/core/app_export.dart';
import 'package:chat_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/presentation/setting_page_bottomsheet/setting_page_bottomsheet.dart';

import '../chat_window_screen/group.dart';
import '../chat_window_screen/group_window_screen.dart';


class ChatListPageScreen extends StatelessWidget {
  const ChatListPageScreen({Key? key, required String accesstoken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

            extendBody: true,
            extendBodyBehindAppBar: true,
            body: SingleChildScrollView(
            child: Container(
                width: SizeUtils.width,
                height: SizeUtils.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(0.5, 0),
                        end: Alignment(0.5, 1),
                        colors: [
                          appTheme.black90001,
                          appTheme.blueGray90004,
                          theme.colorScheme.secondaryContainer
                        ])),
                child: SizedBox(
                    width: double.maxFinite,
                        child: SingleChildScrollView(
                            child:  Column (
                            children: [
                              _buildHeaderRow(context),
                              SizedBox(height: 37.v),
                              SizedBox(
                                  height: 688.v,
                                  width: double.maxFinite,
                                  child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [

                                        _buildContactList(context)
                                      ]))
                            ])))))));
  }

  /// Section Widget
  Widget _buildHeaderRow(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 12.v),
          decoration: AppDecoration.fillGray,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.only(top: 6.v, bottom: 8.v),

                  child: CustomImageView(

                      imagePath: ImageConstant.imgArrowLeftWhiteA700,
                      onTap: () {
                             onTapBtnArrowLeft(context);
                         },
                  )
                 ),
          Padding(
              padding: EdgeInsets.only(left: 32.h, top: 13.v, bottom: 14.v),
              child: Text("Chatter Box",
                  style: CustomTextStyles.bodyLargeCroissantOneBlack90001)),
          Spacer(),
          CustomImageView(
              imagePath: ImageConstant.imgUsers,
              height: 50.adaptSize,
              width: 50.adaptSize,
              margin: EdgeInsets.only(top: 1.v, right: 5.h),
              onTap: () {
                onTapImgUsers(context);
              }),
          Spacer(),
          CustomImageView(
              imagePath: ImageConstant.imgSettingsBlack90001,
              height: 50.adaptSize,
              width: 50.adaptSize,
              margin: EdgeInsets.only(top: 1.v, right: 5.h),
              onTap: () {
                onTapImgSettings(context);
              })
        ]));
  }

  /// Section Widget
  Widget _buildContactList(BuildContext context) {
    //SingleChildScrollView = true;
    return Align(

        alignment: Alignment.topCenter,
        child: Padding(

            padding: EdgeInsets.fromLTRB(24.h, 1.v, 9.h, 1.v),
            child: Expanded(

          child: Contact(),

             )));
  }

  /// Navigates back to the previous screen.
  onTapBtnArrowLeft(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => HomePageScreen(),
        isScrollControlled: true);
  }

  /// Shows a modal bottom sheet with [SettingPageBottomsheet]
  /// widget content.
  /// The sheet is displayed on top of the current view with scrolling enabled if
  /// content exceeds viewport height.
  onTapImgSettings(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => SettingPageBottomsheet(),
        isScrollControlled: true);
  }
  onTapImgUsers(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => HomePage(),
        isScrollControlled: true);
  }
}
