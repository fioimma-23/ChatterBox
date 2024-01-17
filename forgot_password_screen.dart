import 'dart:convert';

import 'package:chat_app/core/app_export.dart';
import 'package:chat_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:chat_app/widgets/app_bar/custom_app_bar.dart';
import 'package:chat_app/widgets/custom_elevated_button.dart';
import 'package:chat_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../chat_list_page_screen/chat_list_page_screen.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController newpasswordController = TextEditingController();

  TextEditingController reenterpasswordController = TextEditingController();

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
                        colors: [appTheme.black90001, appTheme.blueGray90003])),
                child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                        padding: EdgeInsets.only(top: 49.v),
                        child: Column(children: [
                          Text("Forgot Password",
                              style: theme.textTheme.headlineLarge),
                          SizedBox(height: 97.v),
                          Container(
                              height: 89.adaptSize,
                              width: 89.adaptSize,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.h, vertical: 18.v),
                              decoration: AppDecoration.outline.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder44),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgVector,
                                  height: 49.v,
                                  width: 36.h,
                                  alignment: Alignment.center)),
                          SizedBox(height: 51.v),
                          Text("Phone Number",
                              style: CustomTextStyles.titleMediumWhiteA700),
                          SizedBox(height: 12.v),
                          Padding(
                              padding: EdgeInsets.only(left: 35.h, right: 36.h),
                              child: CustomTextFormField(
                                  controller: newpasswordController,
                                  hintText: "Enter your Phone Number",
                                hintStyle: TextStyle(fontSize:10.0, color: Colors.white, fontWeight: FontWeight.normal),

                              )),
                          SizedBox(height: 28.v),
                          Text("New Password",
                              style: CustomTextStyles.titleMediumWhiteA700),
                          SizedBox(height: 14.v),
                          Padding(
                              padding: EdgeInsets.only(left: 35.h, right: 36.h),
                              child: CustomTextFormField(
                                  controller: reenterpasswordController,
                                  hintText: "Enter your New Password",
                                  hintStyle: TextStyle(fontSize:10.0, color: Colors.white, fontWeight: FontWeight.normal),
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.visiblePassword,
                                  obscureText: true)),
                          SizedBox(height: 38.v),
                          CustomElevatedButton(
                              onPressed: ()
                               {
                                 forgetpasswordUser(context);
                               },

                              text: "Reset\nPassword",
                              buttonStyle: CustomButtonStyles.none,
                              decoration: CustomButtonStyles
                                  .gradientBlueGrayToBlackDecoration),
                          SizedBox(height: 100.v),
                          CustomImageView(
                              imagePath: ImageConstant.imgEllipse5524x360,
                              height: 524.v,
                              width: 360.h)
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 359.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgVectorWhiteA700,
            margin: EdgeInsets.fromLTRB(30.h, 18.v, 304.h, 19.v),
            onTap: () {
              onTapVector(context);
            }));
  }

  /// Navigates back to the previous screen.
  onTapVector(BuildContext context) {
    Navigator.pop(context);
  }
  onTapResetPassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.chatListPageScreen);
  }
  Future<void> forgetpasswordUser(BuildContext context) async {
    var c = [
      {'Content-Type': 'application/json'}

    ];

    try {
      String baseUrl = "https://localhost:7057/api/ChatterBox/ForgotPassword";
      Uri uri = Uri.parse(baseUrl);
      Map<String, String> queryParameters = {
        'phoneNumber': phoneNumberController.text.trim().toString(),
        'Password': newpasswordController.text.trim().toString(),
      };
      uri = uri.replace(queryParameters: queryParameters);
      var response = await http.get(uri, headers: c[0]);
      if (response.statusCode == 200){
        var jsonResponse = json.decode(response.body);
        if (jsonResponse['errorCode'] == 0){
          Navigator.push(
            context as BuildContext,
            MaterialPageRoute(builder: (context) => ChatListPageScreen(accesstoken: '')),
          );
        } else {
          print("error");
          ScaffoldMessenger.of(context as BuildContext).showSnackBar(SnackBar(
            content: Text('Error: ${['Message']}'),
            backgroundColor: Colors.red.shade300,
          ));
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
