import 'package:chat_app/core/app_export.dart';
import 'package:chat_app/widgets/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/presentation/setting_page_bottomsheet/setting_page_bottomsheet.dart';


class NotificationPageBottomsheet extends StatefulWidget {
  NotificationPageBottomsheet({Key? key}) : super(key: key);

  @override
  _NotificationPageBottomsheetState createState() =>
      _NotificationPageBottomsheetState();
}

class _NotificationPageBottomsheetState
    extends State<NotificationPageBottomsheet> {

  bool isSelectedSwitch = false;

  bool isSelectedSwitch1 = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 11.v),
            child: Column(children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                      padding: EdgeInsets.only(right: 46.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 3.v,
                                width: 30.h,
                                margin: EdgeInsets.only(top: 2.v, bottom: 28.v),
                                decoration: BoxDecoration(
                                    color: appTheme.black90001,
                                    borderRadius: BorderRadius.circular(1.h))),
                            Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 0,
                                margin: EdgeInsets.only(left: 42.h),
                                color: theme.colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder16),
                                child: Container(
                                    height: 33.v,
                                    width: 70.h,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.h),
                                    decoration: AppDecoration.fillPrimary
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder16),
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Text("Save",
                                                  style: CustomTextStyles
                                                      .titleMediumMulishPrimary)),
                                          Align(
                                              alignment: Alignment.center,
                                              child: GestureDetector(
                                                  onTap: () {
                                                    onTapTxtSave(context);
                                                  },
                                                  child: Text("Save",
                                                      style: CustomTextStyles
                                                          .labelLargeMulishWhiteA700)))
                                        ])))
                          ]))),
              SizedBox(height: 16.v),
              _buildDescriptionSection(context),
              SizedBox(height: 36.v),
              Divider(),
              SizedBox(height: 36.v)
            ])));
  }

  /// Section Widget
  Widget _buildDescriptionSection(BuildContext context) {
    return SizedBox(
        height: 226.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  width: 168.h,
                  margin: EdgeInsets.only(left: 25.h),
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "\n\nChat Sounds\n\n",
                            style: CustomTextStyles.titleLargeGray60001),
                        TextSpan(
                            text:
                                "\n\nDisplay chat notification",
                            style: CustomTextStyles.titleLargeGray60001),

                      ]),
                      textAlign: TextAlign.left))),
          Align(
            alignment: Alignment.topLeft, // Adjusted alignment
            child: Padding(
            padding: EdgeInsets.only(left: 9.0,top: 1.0),

                child: Text(
                  "Options", // Added text "Options" here
                  style:TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20.0,
                  ),
                  textDirection: TextDirection.ltr,
                ),
              ),
            ),

          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 5.v),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Divider(),
                    SizedBox(height: 65.v),
                    CustomSwitch(
                      margin: EdgeInsets.only(right: 76.h),
                      alignment: Alignment.centerRight,
                      value: isSelectedSwitch,
                      onChange: (value) {
                        setState(() {
                          isSelectedSwitch = value;
                        });
                      },
                    ),
                    SizedBox(height: 24.v),
                    Divider(),
                    SizedBox(height: 27.v),
                    CustomSwitch(
                      margin: EdgeInsets.only(right: 76.h),
                      alignment: Alignment.centerRight,
                      value: isSelectedSwitch1,
                      onChange: (value) {
                        setState(() {
                          isSelectedSwitch1 = value;
                        });
                      },
                    ),
                  ])))
        ]));
  }

  /// Shows a modal bottom sheet with [SettingPageBottomsheet]
  /// widget content.
  /// The sheet is displayed on top of the current view with scrolling enabled if
  /// content exceeds viewport height.
  onTapTxtSave(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => SettingPageBottomsheet(),
        isScrollControlled: true);
  }
}
