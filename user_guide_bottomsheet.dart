import 'package:chat_app/core/app_export.dart';
import 'package:flutter/material.dart';


class UserGuideBottomsheet extends StatelessWidget {
  const UserGuideBottomsheet({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
    //  width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 20.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL40,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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

          SizedBox(height: 26.v),
          SizedBox(
            width: 307.h,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: " Download and Install:",
                    style: CustomTextStyles.bodyLargeBlack90001,
                  ),
                  TextSpan(
                    text:
                        "\nBegin by downloading the Chatter Box app from your device's app store. Install it to start your secure communication journey.\r.\n",
                      style: TextStyle(
                          height: 2,
                          color: Colors.black,
                          fontSize: 10

                      )
                  ),
                  TextSpan(
                    text: "\nCreate Your Account: ",
                    style: CustomTextStyles.bodyLargeBlack90001,
                  ),
                  TextSpan(
                    text:
                        "\nSign up by providing a valid email or phone number. Set a strong password to ensure the security of your account.\r\n\n",
                      style: TextStyle(
                          height: 2,
                          color: Colors.black,
                          fontSize: 10

                      )
                  ),
                  TextSpan(
                    text: " Personalize Your Profile:",
                    style: CustomTextStyles.bodyLargeBlack90001,
                  ),
                  TextSpan(
                    text:
                        "\nAdd a profile picture and customize your username to make your Chatter Box experience more personal.\n\n",
                      style: TextStyle(
                          height: 2,
                          color: Colors.black,
                          fontSize: 10

                      )
                  ),
                  TextSpan(
                    text: " Start a Chat:",
                    style: CustomTextStyles.bodyLargeBlack90001,
                  ),
                  TextSpan(
                    text:
                        "\nTap the '+' button or select a contact to initiate a chat. Enjoy real-time messaging with friends and family.\r\n\n",
                      style: TextStyle(
                          height: 2,
                          color: Colors.black,
                          fontSize: 10

                      )
                  ),
                  TextSpan(
                    text: " Enable End-to-End Encryption:",
                    style: CustomTextStyles.bodyLargeBlack90001,
                  ),
                  TextSpan(
                    text:
                        "\nActivate the end-to-end encryption feature in the settings for an added layer of privacy, ensuring that only you and the recipient can access your messages.\r\n\n",
                      style: TextStyle(
                          height: 2,
                          color: Colors.black,
                          fontSize: 10

                      )
                  ),
                  TextSpan(
                    text: "Manage Notifications: ",
                    style: CustomTextStyles.bodyLargeBlack90001,
                  ),
                  TextSpan(
                    text:
                        "\nTailor your notification preferences to stay informed without being overwhelmed. Adjust settings for a seamless and personalized user experience\n.\n",
                      style: TextStyle(
                          height: 2,
                          color: Colors.black,
                          fontSize: 10

                      )
                  ),
                  TextSpan(
                    text:
                        "Explore Additional Features: ",
                    style: CustomTextStyles.bodyLargeBlack90001,
                  ),
                  TextSpan(
                      text:
                      "\nDiscover and utilize additional features such as group chats, voice messages, and stickers to make your Chatter Box conversations more dynamic and enjoyable.\n.\n",
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
          SizedBox(height: 5.v),
        ],
      ),
      ),
    );
  }
}
