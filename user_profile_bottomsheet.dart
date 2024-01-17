import 'dart:convert';

import 'package:chat_app/core/app_export.dart';
import 'package:chat_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/presentation/setting_page_bottomsheet/setting_page_bottomsheet.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../widgets/custom_text_form_field.dart';



class UserProfileBottomsheet extends StatefulWidget {
  UserProfileBottomsheet({super.key});

  @override
  State<UserProfileBottomsheet> createState() => _UserProfileBottomSheetState();
}

class _UserProfileBottomSheetState extends State<UserProfileBottomsheet> {
  TextEditingController DisplayNameController = TextEditingController();

  TextEditingController AboutController = TextEditingController();

  TextEditingController EmailAddressController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ImagePicker _imagePicker = ImagePicker();
  late String _selectedImagePath = ImageConstant.imgCamera;

  get child => null;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 20.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL40),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      height: 3.v,
                      width: 30.h,
                      decoration: BoxDecoration(
                          color: appTheme.black90001,
                          borderRadius: BorderRadius.circular(1.h)))),
              Align(
                alignment: Alignment.topCenter,
              child: CustomImageView(
                imagePath: _selectedImagePath ?? ImageConstant.imgCamera,
                height: 30.v,
                width: 28.h,
                radius: BorderRadius.circular(28.h),
                margin: EdgeInsets.only(bottom: 9.v),
                onTap: () async {
                  PickedFile? pickedFile = (await _imagePicker.pickImage(source: ImageSource.camera)) as PickedFile?;
                  if (pickedFile != null) {
                    setState(() {
                      _selectedImagePath = pickedFile.path;
                    });
                  }
                },
              ),
              ),
              SizedBox(height: 36.v),
              Padding(
                  padding: EdgeInsets.only(left: 17.h),
                  child:
                  Text("Display Name", style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
              SizedBox(height: 11.v),
              CustomTextFormField(
                  controller: DisplayNameController,
                  hintText: "Enter your Name",
                  hintStyle: TextStyle(fontSize:10.0, color: Colors.black, fontWeight: FontWeight.normal),
                  textInputType: TextInputType.name),
              SizedBox(height: 27.v),
              Padding(
                  padding: EdgeInsets.only(left: 17.h),
                  child: Text("About", style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
              SizedBox(height: 15.v),
              CustomTextFormField(
                  controller: AboutController,
                  hintText: "Enter Your About",

                  hintStyle: TextStyle(fontSize:10.0, color: Colors.black, fontWeight: FontWeight.normal),

                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.h, vertical: 24.v)),

              SizedBox(height: 40.v),
              Padding(
                  padding: EdgeInsets.only(left: 17.h),
                  child:
                  Text("Phone  Number", style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
              SizedBox(height: 15.v),
              CustomTextFormField(
                  controller: phoneNumberController,
                  hintText: "Enter Your Phone number",
                  hintStyle: TextStyle(fontSize:10.0, color: Colors.black, fontWeight: FontWeight.normal),
                  textInputType: TextInputType.phone,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.h, vertical: 24.v)),
              SizedBox(height: 62.v),
              CustomElevatedButton(
                height: 52.v,
                text: "Save",
                margin: EdgeInsets.only(right: 19.h),
                buttonStyle: CustomButtonStyles.fillPrimary,
                buttonTextStyle: CustomTextStyles.titleMediumMulishGray50,
                // onPressed: () {
                //   onTapSave(context);
                // }
                onPressed: () {
                  profileUser(context);

                  // Navigate to the second screen when the button is pressed
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => SettingPageBottomsheet()),
                  // );
                },
              ),
              SizedBox(height: 24.v)
            ]));
  }

  Future<void> profileUser(context) async {
    var l=[
      {  'Content-Type': 'application/json' }
    ];
    var m=[
      {
        "rowId": "0",
        "action": "U",
        "userId": phoneNumberController.text.trim().toString(),
        "userName": DisplayNameController.text.trim().toString(),
        "password": "",
        "about": AboutController.text.trim().toString(),
        "isActive": true
      }
    ];
    try {
      var response = await http.post(
        Uri.parse("http://localhost/Chatterbox/api/ChatBox/SignUp"),
        headers: l[0],
        body: jsonEncode(m[0]),
      );

      if (response.statusCode == 200){
        var jsonResponse = json.decode(response.body);
        if (jsonResponse['errorCode'] == 0 ){
          fetchData();
          Navigator.push(
            context as BuildContext,
            MaterialPageRoute(builder: (context) => SettingPageBottomsheet()),
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
  Future<void> fetchData() async {
    try {
      var response = await http.get(
        Uri.parse("http://localhost/Chatterbox/api/ChatBox/SignUp"), // Replace with your API endpoint
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
       // List<dynamic> userData = jsonResponse['userData'];
        // Process the jsonResponse as needed
        print("Error fetching successfully");
      } else {
        print("Error fetching data");
      }
    } catch (e) {
      print(e);
    }
  }

onTapSave(context) {

  showModalBottomSheet(
      context: context,
      builder: (_) => SettingPageBottomsheet(),
      isScrollControlled: true);
}
}






