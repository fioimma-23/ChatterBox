import 'dart:convert';
import 'dart:js';

import 'package:chat_app/core/app_export.dart';
import 'package:chat_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:chat_app/widgets/app_bar/custom_app_bar.dart';
import 'package:chat_app/widgets/custom_elevated_button.dart';
import 'package:chat_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../chat_list_page_screen/chat_list_page_screen.dart';

// ignore_for_file: must_be_immutable
class LoginPageScreen extends StatelessWidget {
  LoginPageScreen({Key? key}) : super(key: key);

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

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
                        colors: [appTheme.black90001, appTheme.blueGray90001])),
                child: Form(
                    key: _formKey,
                    child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                            horizontal: 35.h, vertical: 15.v),
                        child: Column(children: [
                          SizedBox(height: 28.v),
                          Text("Login ", style: theme.textTheme.headlineLarge),
                          SizedBox(height: 28.v),
                          Text("Welcome Back",
                              style: CustomTextStyles.headlineLargeConstantia),
                          SizedBox(height: 40.v),
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
                          SizedBox(height: 29.v),
                          Text("Phone Number",
                              style: CustomTextStyles.titleMediumWhiteA700),
                          SizedBox(height: 15.v),
                          CustomTextFormField(
                              controller: phoneNumberController,
                              hintText: "Enter your  Phone Number",
                              hintStyle: TextStyle(fontSize:10.0, color: Colors.white, fontWeight: FontWeight.normal),
                              textInputType: TextInputType.phone,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12.h, vertical: 24.v)),
                          SizedBox(height: 16.v),
                          _buildLoginForm(context),
                          SizedBox(height: 24.v),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                  onTap: () {
                                    onTapTxtForgotPassword(context);
                                  },
                                  child: Text("Forgot Password?",
                                      style: CustomTextStyles
                                          .bodyLargeWhiteA700_1)),
                          ),
                          SizedBox(height: 24.v),
                          Align(
                            alignment: Alignment.centerLeft,
                            child:  GestureDetector(
                                onTap: () {
                                  onTapTxtNewToChatterBox(context);
                                },
                                child: Text("New to ChatterBox?",
                                    style: CustomTextStyles
                                        .bodyLargeWhiteA700_1)),

                          )

                        ])))),
            bottomNavigationBar: _buildLoginButton(context)));
  }


  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 359.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgVectorWhiteA700,
            margin: EdgeInsets.fromLTRB(23.h, 18.v, 311.h, 19.v),
            onTap: () {
              onTapVector(context);
            }));
  }


  Widget _buildLoginForm(BuildContext context) {
    return Column(children: [
      Text("Password", style: CustomTextStyles.titleMediumWhiteA700),
      SizedBox(height: 8.v),
      CustomTextFormField(
          controller: passwordController,
          hintText: "Enter your  Password",
          hintStyle: TextStyle(fontSize:10.0, color: Colors.white, fontWeight: FontWeight.normal),
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          obscureText: true)
    ]);
  }


  Widget _buildLoginButton(BuildContext context) {
    return CustomElevatedButton(
        width: 200.h,
        text: "Login ",
        margin: EdgeInsets.only(left: 79.h, right: 81.h, bottom: 44.v),
        buttonStyle: CustomButtonStyles.none,
        decoration: CustomButtonStyles.gradientBlueGrayToBlackDecoration,
      onPressed: () {
        loginUser(context);
        // Navigate to the second screen when the button is pressed
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => ChatListPageScreen()),
        // );
      },);
  }


  onTapVector(BuildContext context) {
    Navigator.pop(context);
  }


  onTapTxtForgotPassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordScreen);
  }

  onTapTxtNewToChatterBox(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpScreen);
  }


  onTapLoginButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.chatListPageScreen);
  }

  Future<void> loginUser(BuildContext context) async {
    var c = [
      {'Content-Type': 'application/json'}

    ];

    try {
      String baseUrl = "https://localhost:7057/api/ChatterBox/LogIn";
      Uri uri = Uri.parse(baseUrl);
      Map<String, String> queryParameters = {
        'phoneNumber': phoneNumberController.text.trim().toString(),
        'Password': passwordController.text.trim().toString(),
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
