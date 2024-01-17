import 'package:chat_app/core/app_export.dart';
import 'package:flutter/material.dart';

class SecurityPageBottomsheet extends StatelessWidget {
  const SecurityPageBottomsheet({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL40,
      ),
      child: Column(

        mainAxisSize: MainAxisSize.min,
        children: [

          SizedBox(height: 13.v),
          Container(
            height: 3.v,
            width: 30.h,
            decoration: BoxDecoration(
              color: appTheme.black90001,
              borderRadius: BorderRadius.circular(
                1.h,
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerRight,
            child: Container(

              width: 256.h,
              margin: EdgeInsets.only(
                left: 46.h,
                right: 27.h,
              ),
              child: Text(
                "Welcome to Chatter Box - Your Secure Communication Hub !",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyMediumBlack90001.copyWith(
                  height: 1.43,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Container(
            width: 323.h,
            margin: EdgeInsets.only(right: 6.h),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "\rEnd-to-End Encryption:",
                    style: CustomTextStyles.bodyLargeBlack90001,
                  ),
                  TextSpan(
                    text:
                        "\rYour privacy is our top priority. Chatter Box employs robust end-to-end encryption, ensuring that your messages, calls, and shared media are securely transmitted and can only be accessed by you and your intended recipients.\n",
                      style: TextStyle(
                          height: 2,
                          color: Colors.black,
                          fontSize: 10

                      )
                  ),
                  TextSpan(
                    text: "\rSecure Account Authentication: ",
                    style: CustomTextStyles.bodyLargeBlack90001,
                  ),
                  TextSpan(
                    text:
                        "\rProtect your account with our advanced authentication methods. \n",
                    style: TextStyle(
                      height: 2,
                      color: Colors.black,
                      fontSize: 10

                    )
                  ),
                  TextSpan(
                    text: "\rData Protection: ",
                    style: CustomTextStyles.bodyLargeBlack90001,
                  ),
                  TextSpan(
                    text:
                        "\rWe adhere to strict data protection standards. Your personal information is handled with care, and we do not compromise on the security of your data. Read our privacy policy for detailed information on how we handle user data.\r\n",
                      style: TextStyle(
                          height: 2,
                          color: Colors.black,
                          fontSize: 10

                      )
                  ),
                  TextSpan(
                    text: "\rRegular Security Audits: ",
                    style: CustomTextStyles.bodyLargeBlack90001,
                  ),
                  TextSpan(
                    text:
                        "\rChatter Box undergoes regular security audits and assessments to identify and address potential vulnerabilities. We are committed to maintaining a secure environment for your communication needs.\r\n",
                      style: TextStyle(
                          height: 2,
                          color: Colors.black,
                          fontSize: 10

                      )
                  ),
                  TextSpan(
                    text: "\rTransparent Security Updates: ",
                    style: CustomTextStyles.bodyLargeBlack90001,
                  ),
                  TextSpan(
                    text:
                        "\rStay informed about the latest security updates and enhancements. We believe in transparency, and our security updates page provides details on the improvements made to ensure your safety on Chatter Box.\r\n",
                      style: TextStyle(
                          height: 2,
                          color: Colors.black,
                          fontSize: 10

                      )
                  ),
                  TextSpan(
                    text: "\rCommunity Guidelines:",
                    style: CustomTextStyles.bodyLargeBlack90001,
                  ),
                  TextSpan(
                    text:
                        "\rTo maintain a secure and positive environment, familiarize yourself with our community guidelines. Respectful communication and responsible usage contribute to a safer and more enjoyable Chatter Box experience.\r\n\r\nAt Chatter Box, we are committed to providing you with a secure and reliable platform for all your communication needs. Your trust in our security measures is our greatest asset.",
                      style: TextStyle(
                          height: 2,
                          color: Colors.black,
                          fontSize: 10

                      )
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
        ),
    );
  }
}
