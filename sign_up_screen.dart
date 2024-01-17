import 'dart:io';

import 'package:chat_app/api/endpoints.dart';
import 'package:chat_app/core/app_export.dart';
import 'package:chat_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:chat_app/widgets/app_bar/appbar_title_image.dart';
import 'package:chat_app/widgets/app_bar/custom_app_bar.dart';
import 'package:chat_app/widgets/custom_elevated_button.dart';
import 'package:chat_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../api/api.dart';
//import '../../modelclass/sign_up_request.dart';
import '../chat_list_page_screen/chat_list_page_screen.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  TextEditingController userNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   // final HttpClient httpClient = HttpClient();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
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
                child: Form(
                  key: _formKey,
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 35.h, vertical: 15.v),
                    child: Column(
                      children: [
                        SizedBox(height: 36.v),
                        Align(
                          alignment: Alignment.center,
                          child: Text("Sign Up", style: theme.textTheme.headlineLarge),
                        ),
                        SizedBox(height: 41.v),
                        Container(
                          height: 89.adaptSize,
                          width: 89.adaptSize,
                          padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 18.v),
                          decoration: AppDecoration.outline.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder44,
                          ),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgVector,
                            height: 49.v,
                            width: 36.h,
                            alignment: Alignment.center,
                          ),
                        ),
                        SizedBox(height: 17.v),
                        Text("User Name", style: CustomTextStyles.titleMediumBluegray100),
                        SizedBox(height: 9.v),
                        _buildUserName(context),
                        SizedBox(height: 15.v),
                        _buildFortyFive(context),
                        SizedBox(height: 17.v),
                        Text("Password", style: CustomTextStyles.titleMediumWhiteA700),
                        SizedBox(height: 10.v),
                        _buildPassword(context),
                        SizedBox(height: 26.v),
                        _buildSignUp(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 68.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 32.h, top: 8.v, bottom: 11.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarTitleImage(
            imagePath: ImageConstant.imgIconsaxLinearHambergermenu,
            margin: EdgeInsets.only(left: 1136.h))
    );
  }

  /// Section Widget
  Widget _buildUserName(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 35.h, right: 36.h),
        child: CustomTextFormField(
            controller: userNameController,
            hintText: "Enter your Name",
            hintStyle: TextStyle(fontSize:10.0, color: Colors.white, fontWeight: FontWeight.normal),
    ));
  }

  /// Section Widget
  Widget _buildFortyFive(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 34.h),
        child: Column(children: [
          Text("Phone Number", style: CustomTextStyles.titleMediumWhiteA700),
          SizedBox(height: 11.v),
          CustomTextFormField(
              controller: phoneNumberController,
              hintText: "Enter your Phone Number",
              hintStyle: TextStyle(fontSize:10.0, color: Colors.white, fontWeight: FontWeight.normal),
              textInputType: TextInputType.phone)
        ]));
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 35.h, right: 34.h),
        child: CustomTextFormField(
            controller: passwordController,
            hintText: "Enter your Password",
            hintStyle: TextStyle(fontSize:10.0, color: Colors.white, fontWeight: FontWeight.normal),
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            obscureText: true));
  }

  /// Section Widget
  Widget _buildSignUp(BuildContext context) {
    return CustomElevatedButton(
      width: 200.h,
      text: "Sign Up",
      margin: EdgeInsets.only(left: 79.h, right: 81.h, bottom: 44.v),
      buttonStyle: CustomButtonStyles.none,
      decoration: CustomButtonStyles.gradientBlackToBlackDecoration,
      onPressed:(){
        registerUser(context);


        },


    ); // Add this closing parenthesis
  }



  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the verificationScreen when the action is triggered.
  onTapSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.chatListPageScreen);
  }

  /// Navigates to the loginPageScreen when the action is triggered.
  onTapLogIn(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginPageScreen);
  }

  Future<void> registerUser(context) async {
    var b=[
      {  'Content-Type': 'application/json' }
    ];
    var a=[
      {
        "Action": "A",
        "rowId": "0",
        "userId": phoneNumberController.text,
        "userName": userNameController.text,
        "password": passwordController.text,
        "isActive": "true"
      }
    ];
    try {
      var response = await http.post(
        Uri.parse("https://localhost:7057/api/ChatBox/SignUp"),
        headers: b[0],
        body: jsonEncode(a[0]),
      );

      if (response.statusCode == 200){
        var jsonResponse = json.decode(response.body);
        if (jsonResponse['errorCode'] == 1){
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



