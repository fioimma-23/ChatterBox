import 'package:chat_app/presentation/invite_screen/widgets/contactlist_item_widget.dart';

import '../contact_list_bottomsheet/widgets/userprofilesection_item_widget.dart';
import 'package:chat_app/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class ContactListBottomsheet extends StatelessWidget {
  ContactListBottomsheet({Key? key})
      : super(
          key: key,
        );

  List contactList = [
    {'id': 1, 'groupBy': "A"},
    {'id': 2, 'groupBy': "A"},
    {'id': 3, 'groupBy': "B"},
    {'id': 4, 'groupBy': "B"},
    {'id': 5, 'groupBy': "B"},
    {'id': 6, 'groupBy': "S"}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 11.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL40,
      ),
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
                borderRadius: BorderRadius.circular(
                  1.h,
                ),
              ),
            ),
          ),
          SizedBox(height: 26.v),
          Text(
            "My Contact",
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(height: 14.v),
          _buildUserProfileSection(context),
          SizedBox(height: 49.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfileSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 104.h),
      child: GroupedListView<dynamic, String>(
        shrinkWrap: true,
        stickyHeaderBackgroundColor: Colors.transparent,
        elements: contactList,
        groupBy: (element) => element['groupBy'],
        sort: false,
        groupSeparatorBuilder: (String value) {
          return Padding(
            padding: EdgeInsets.only(
              top: 28.v,
              bottom: 17.v,
            ),
            child: Column(
              children: [
                Text(
                  value,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: theme.colorScheme.onErrorContainer,
                  ),
                ),
              ],
            ),
          );
        },
        itemBuilder: (context, model) {
          return MyHomePage();
        },
        separator: SizedBox(
          height: 20.v,
        ),
      ),
    );
  }
}
