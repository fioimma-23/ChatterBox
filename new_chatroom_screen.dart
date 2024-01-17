import 'dart:convert';

import 'package:chat_app/core/app_export.dart';
import 'package:chat_app/presentation/chat_list_page_screen/chat_list_page_screen.dart';
import 'package:chat_app/presentation/setting_page_bottomsheet/setting_page_bottomsheet.dart';
import 'package:chat_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:chat_app/widgets/app_bar/custom_app_bar.dart';
import 'package:chat_app/widgets/custom_elevated_button.dart';
import 'package:chat_app/widgets/custom_icon_button.dart';
import 'package:chat_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore_for_file: must_be_immutable
class NewChatroomScreen extends StatelessWidget {
  NewChatroomScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();

  TextEditingController descriptionvalueController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // get accessToken => ();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: appTheme.gray900,
            resizeToAvoidBottomInset: false,
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
                      theme.colorScheme.secondaryContainer
                    ]
                     )),
                child: SingleChildScrollView(
                    key: _formKey,
                    child: SizedBox(
                        width: double.maxFinite,
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          SizedBox(height: 3.v),
                          Container(
                              padding: EdgeInsets.symmetric(vertical: 30.v),
                              decoration: AppDecoration.gradientBlackToBlueGray,
                              child: Column(children: [
                                _buildAppBar(context),
                                SizedBox(height: 64.v),
                                Text("New Chatroom",
                                    style: CustomTextStyles
                                        .headlineLargeConstantiaBold),
                                SizedBox(height: 32.v),
                                CustomIconButton(
                                    height: 80.v,
                                    width: 89.h,
                                    padding: EdgeInsets.all(23.h),
                                    child: CustomImageView(
                                        imagePath:
                                            ImageConstant.imgSearchPrimary)),
                                SizedBox(height: 68.v),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 41.h, right: 30.h),
                                    child: CustomTextFormField(
                                        controller: nameController,
                                        hintText: "Name",
                                      hintStyle: TextStyle(fontSize:10.0, color: Colors.white, fontWeight: FontWeight.normal),)
                                ),
                                SizedBox(height: 29.v),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 41.h, right: 30.h),
                                    child: CustomTextFormField(
                                        controller: descriptionvalueController,
                                        hintText: "Description",
                                        hintStyle: TextStyle(fontSize:10.0, color: Colors.white, fontWeight: FontWeight.normal),
                                        textInputAction: TextInputAction.done)),
                                SizedBox(height: 29.v),
                                _buildTwentyNine(context),
                                SizedBox(height: 68.v),
                                CustomElevatedButton(
                                    width: 200.h,
                                    text: "Create Chatroom",
                                    margin: EdgeInsets.only(left: 79.h, right: 81.h, bottom: 44.v),
                                    buttonStyle: CustomButtonStyles.none,
                                    decoration: CustomButtonStyles
                                        .gradientWhiteAToBlackDecoration,
                                    buttonTextStyle:
                                        CustomTextStyles.bodyLargeBlack90001,
                                    onPressed: () {
                                      addChatRoomUser(context);
                                      // onTapCreateChatroom(context);
                                    },
                                    alignment: Alignment.centerRight),
                                SizedBox(height: 45.v)
                              ]))
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(height: 58.v, actions: [
      AppbarTrailingImage(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingPageBottomsheet()),
            );
          },
          imagePath: ImageConstant.imgVectorWhiteA70011x11,
          margin: EdgeInsets.symmetric(horizontal: 38.h, vertical: 8.v))
    ]);
  }

  /// Section Widget
  Widget _buildTwentyNine(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 41.h, right: 30.h),
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 18.v),
        decoration: AppDecoration.outlineWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder32),
        child: Row(mainAxisSize: MainAxisSize.max, children: [
          SizedBox(
              height: 24.v,
              width: 20.h,
              child: Stack(alignment: Alignment.centerRight, children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                        height: 21.v,
                        width: 20.h,
                        decoration: BoxDecoration(
                            color: appTheme.whiteA700,
                            borderRadius: BorderRadius.circular(10.h)))),
                Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                        padding: EdgeInsets.only(right: 4.h, top: 1.h),
                        child: Text("+",
                            style: CustomTextStyles.titleLargeRobotoPrimary)))
              ])),
          Padding(
              padding: EdgeInsets.only(left: 28.h, top: 6.v, bottom: 2.v),
              child: Text("Add Participants",
                  style: CustomTextStyles.bodySmallGray500))
        ]));
  }

  /// Navigates to the chatListPageScreen when the action is triggered.
  onTapCreateChatroom(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => ChatListPageScreen(accesstoken: 'accessToken'),
        isScrollControlled: true);
  }
  Future<void> addChatRoomUser(context) async {
    var g=[
      {  'Content-Type': 'application/json' }
    ];
    var h=[
      {
        // "rowId": "0",
        "userId": "9498372305",
        "groupName": nameController.text.trim().toString(),
        "groupDescription": descriptionvalueController.text.trim().toString()

      }
    ];
    try {
      var response = await http.post(
        Uri.parse("https://localhost:7057/api/ChatterBox/AddChatRoom"),
        headers: g[0],
        body: jsonEncode(h[0]),
      );
      // ScaffoldMessenger.of(context as BuildContext).hideCurrentSnackBar();
      // if (['ErrorCode'] == 0) {
      //   String accessToken = ['access_token'] as String;
      Navigator.push(
        context as BuildContext,
        MaterialPageRoute(builder: (context) => ChatListPageScreen(accesstoken: 'accessToken')),
      );
      // } else {
      //   ScaffoldMessenger.of(context as BuildContext).showSnackBar(SnackBar(
      //     content: Text('Error: ${['Message']}'),
      //     backgroundColor: Colors.red.shade300,
      //   ));
      // }
    } catch (e) {
      print(e);
    }
  }
}
