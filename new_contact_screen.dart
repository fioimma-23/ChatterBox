import 'dart:convert';

import 'package:chat_app/core/app_export.dart';
import 'package:chat_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:chat_app/widgets/app_bar/custom_app_bar.dart';
import 'package:chat_app/widgets/custom_elevated_button.dart';
import 'package:chat_app/widgets/custom_icon_button.dart';
import 'package:chat_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:chat_app/presentation/contact_list_bottomsheet/contact_list_bottomsheet.dart';

import '../chat_list_page_screen/chat_list_page_screen.dart';

// ignore_for_file: must_be_immutable
class NewContactScreen extends StatelessWidget {
  NewContactScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
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
                        ])),
                child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                        padding: EdgeInsets.only(top: 53.v),
                        child: Column(children: [
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 34.h),
                              // decoration: AppDecoration.gradientBlackToPrimary,
                              child: Column(children: [
                                Text("New Contact ",
                                    style: CustomTextStyles
                                        .headlineLargeConstantiaBold),
                                SizedBox(height: 37.v),
                                CustomIconButton(
                                    height: 80.v,
                                    width: 89.h,
                                    padding: EdgeInsets.all(23.h),
                                    child: CustomImageView(
                                        imagePath:
                                            ImageConstant.imgSearchPrimary)),
                                SizedBox(height: 113.v),
                                CustomTextFormField(
                                    controller: nameController,
                                    hintText: "Name",
                                  hintStyle: TextStyle(fontSize:10.0, color: Colors.white, fontWeight: FontWeight.normal),),
                                SizedBox(height: 26.v),
                                CustomTextFormField(
                                    controller: phoneNumberController,
                                    hintText: " Phone Number",
                                    hintStyle: TextStyle(fontSize:10.0, color: Colors.white, fontWeight: FontWeight.normal),
                                    textInputAction: TextInputAction.done,
                                    textInputType: TextInputType.phone),
                                SizedBox(height: 85.v),
                                CustomElevatedButton(
                                    width: 200.h,
                                    text: "Add Contact",
                                    buttonStyle: CustomButtonStyles.none,
                                    decoration: CustomButtonStyles
                                        .gradientWhiteAToBlackDecoration,
                                    buttonTextStyle:
                                        CustomTextStyles.bodyLargeBlack90001,
                                    onPressed: ()
                                      {
                                        addContactUser(context);
                                      },
                                     // onTapAddContact(context);
                                    )
                              ])),
                          SizedBox(height: 132.v),
                          // CustomImageView(
                          //     imagePath: ImageConstant.imgEllipse51,
                          //     height: 524.v,
                          //     width: 360.h)
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(actions: [
      AppbarTrailingImage(
          imagePath: ImageConstant.imgVectorWhiteA70011x11,
          margin: EdgeInsets.symmetric(horizontal: 34.h, vertical: 22.v))
    ]);
  }


  onTapAddContact(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => ChatListPageScreen(accesstoken: 'accessToken'),
        isScrollControlled: true);
  }
  Future<void> addContactUser(context) async {
    var g=[
      {  'Content-Type': 'application/json' }
    ];
    var h=[
      {
        // "rowId": "0",
        "UserId": "9498372305",
        "PhoneNumber": phoneNumberController.text,
        // "userName": userNameController.text,
        "Name": nameController.text,
        // "isActive": "true"
      }
    ];
    try {
      var response = await http.post(
        Uri.parse("https://localhost:7057/api/ChatterBox/AddContact"),
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
