import 'package:flutter/material.dart';
import 'package:chat_app/presentation/home_page_screen/home_page_screen.dart';
import 'package:chat_app/presentation/invite_screen/invite_screen.dart';
import 'package:chat_app/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:chat_app/presentation/login_page_screen/login_page_screen.dart';
import 'package:chat_app/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:chat_app/presentation/verification_screen/verification_screen.dart';
import 'package:chat_app/presentation/chat_list_page_screen/chat_list_page_screen.dart';
import 'package:chat_app/presentation/chat_window_screen/chat_window_screen.dart';
//import 'package:chat_app/presentation/keyboard_two_screen/keyboard_two_screen.dart';
import 'package:chat_app/presentation/new_chatroom_screen/new_chatroom_screen.dart';
import 'package:chat_app/presentation/new_contact_screen/new_contact_screen.dart';
import 'package:chat_app/presentation/app_navigation_screen/app_navigation_screen.dart';

import '../presentation/sign_up_screen/sign_up_screen.dart';

class AppRoutes {
  static const String homePageScreen = '/home_page_screen';

  static const String inviteScreen = '/invite_screen';

  static const String signUpScreen = '/sign_in_screen';

  static const String loginPageScreen = '/login_page_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String verificationScreen = '/verification_screen';

  static const String chatListPageScreen = '/chat_list_page_screen';

  static const String chatroomWindowScreen = '/chatroom_window_screen';

 // static const String keyboardTwoScreen = '/keyboard_two_screen';

  static const String newChatroomScreen = '/new_chatroom_screen';

  static const String newContactScreen = '/new_contact_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    homePageScreen: (context) => HomePageScreen(),
    inviteScreen: (context) => InviteScreen(),
    signUpScreen: (context) => SignUpScreen(),
    loginPageScreen: (context) => LoginPageScreen(),
    forgotPasswordScreen: (context) => ForgotPasswordScreen(),
    verificationScreen: (context) => VerificationScreen(),
    chatListPageScreen: (context) => ChatListPageScreen(accesstoken: 'access_token'),
    chatroomWindowScreen: (context) => ChatWindowScreen(name: '', userId: '',),
    //keyboardTwoScreen: (context) => KeyboardTwoScreen(),
    newChatroomScreen: (context) => NewChatroomScreen(),
    newContactScreen: (context) => NewContactScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
