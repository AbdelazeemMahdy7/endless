import 'package:endless/constant/colors.dart';
import 'package:endless/res/build_profile_item.dart';
import 'package:endless/shared/components.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              child: Column(
                children: [
                  buildTopProfileItem(),
                  const SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: MyColors.primaryColor,
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/person.jpg"),
                          radius: 57,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              context: context,
                              builder: (context) => buildProfileBottomSheet(),
                            );
                          },
                          icon: Icon(
                            Icons.camera_alt,
                            size: 30,
                            color: MyColors.primaryColor,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Zema Mahdy",
                        style: TextStyle(
                            fontSize: 20,
                            color: MyColors.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.edit_outlined,
                        color: MyColors.deafultColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  BuildProfileSettingsItems(
                    text: "Edit profile",
                    icon: Icon(Icons.edit, color: MyColors.deafultColor),
                  ),
                  BuildProfileSettingsItems(
                    text: "Notifications",
                    icon: Icon(Icons.notification_important,
                        color: MyColors.deafultColor),
                  ),
                  BuildProfileSettingsItems(
                    text: "Favorite",
                    icon: Icon(Icons.favorite_border,
                        color: MyColors.deafultColor),
                  ),
                  BuildProfileSettingsItems(
                    text: "Settings",
                    icon: Icon(Icons.settings, color: MyColors.deafultColor),
                  ),
                  BuildProfileSettingsItems(
                    text: "Help",
                    icon: Icon(Icons.help_center_outlined,
                        color: MyColors.deafultColor),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => buildDialogSheet(),
                      );
                      //  show dialog
                    },
                    child: BuildProfileSettingsItems(
                      text: "Sign out",
                      fontWeight: FontWeight.w300,
                      icon: Icon(Icons.logout, color: MyColors.deafultColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDialogSheet() {
    return AlertDialog(
      title: Text("Sign out", style: TextStyle(color: MyColors.primaryColor)),
      content: Text("Are You sure want to sign out ?",
          style: TextStyle(color: MyColors.primaryColor)),
      actions: [
        Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all()),
          child: MaterialButton(
            onPressed: () {},
            child: Text(
              "Cancel",
              style: TextStyle(
                color: MyColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
              color: MyColors.deafultColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all()),
          child: MaterialButton(
            onPressed: () {},
            child: Text(
              "Sign out",
              style: TextStyle(
                color: MyColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
      shape: Border.all(color: MyColors.primaryColor),
      actionsAlignment: MainAxisAlignment.center,
    );
  }

  Widget buildProfileBottomSheet() {
    return SizedBox(
      height: 220,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            CircleAvatar(
              backgroundColor: MyColors.primaryColor,
              radius: 32,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child:
                    Icon(Icons.person, color: MyColors.deafultColor, size: 30),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Icon(
                  Icons.camera_enhance_outlined,
                  color: MyColors.deafultColor,
                  size: 30,
                ),
                const SizedBox(width: 12),
                Text("Choose From Libarary",
                    style:
                        TextStyle(color: MyColors.primaryColor, fontSize: 22)),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(
                  Icons.camera_alt_rounded,
                  color: MyColors.deafultColor,
                  size: 30,
                ),
                const SizedBox(width: 12),
                Text("Take photo",
                    style:
                        TextStyle(color: MyColors.primaryColor, fontSize: 22)),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(
                  Icons.delete,
                  color: MyColors.deafultColor,
                  size: 30,
                ),
                const SizedBox(width: 12),
                Text("Remove current picture",
                    style: TextStyle(
                      color: MyColors.primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w200,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTopProfileItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Profile",
          style: TextStyle(
            fontSize: 25,
            color: MyColors.primaryColor,
          ),
        )
      ],
    );
  }
}
