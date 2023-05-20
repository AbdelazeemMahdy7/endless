import 'package:endless/constant/strings.dart';
import 'package:endless/res/build_profile_item.dart';
import 'package:endless/shared/components.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  buildTopSettingsItem(),
                  const SizedBox(
                    height: 16,
                  ),
                  BuildProfileSettingsItems(
                    text: "Edit profile",
                    icon:  Icon(Icons.edit,color: MyColors.deafultColor),
                  ),
                  BuildProfileSettingsItems(
                    text: "Language",
                    icon:  Icon(Icons.language,color: MyColors.deafultColor),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, notificationsScreen);
                    },
                    child: BuildProfileSettingsItems(
                      text: "Notifications",
                      icon:  Icon(Icons.notifications,color: MyColors.deafultColor),
                    ),
                  ),
                  BuildProfileSettingsItems(
                    text: "Security",
                    icon:  Icon(Icons.security,color: MyColors.deafultColor),
                  ),
                  BuildProfileSettingsItems(
                    text: "Help",
                    icon:  Icon(Icons.help_center_outlined,color: MyColors.deafultColor),
                  ),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTopSettingsItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Text(
          "Settings",
          style: TextStyle(fontSize: 25, color: MyColors.primaryColor,),
        )
      ],
    );
  }
}
