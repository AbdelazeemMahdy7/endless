import 'package:endless/shared/components.dart';
import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/strings.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundImage(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              child: Column(
                children: [
                  buildTopItem(context),
                  const SizedBox(
                    height: 20,
                  ),
                  buildTodayClearTets(),
                  SizedBox(
                    height: 520,
                    child: ListView.builder(
                      itemBuilder: (context,index)=> buildNotificationsItem(),
                      physics: const BouncingScrollPhysics(),
                      itemCount: 20,
                      shrinkWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildTodayClearTets() {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          Text(
            "Today",
            style: TextStyle(
              color: MyColors.primaryColor,
              fontSize: 20,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              print('clear item');
            },
            child: Text(
              "Clear all",
              style: TextStyle(
                color: MyColors.primaryColor,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
// edit this item 86-30-82608-0782-87-87-0587208702-857-
  Widget buildTopItem(context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, endlessScreen);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: MyColors.primaryColor,
              size: 30,
            )),
        const SizedBox(
          width: 70,
        ),
        Text(
          "Notifications",
          style: TextStyle(color: MyColors.primaryColor, fontSize: 25),
        ),
      ],
    );
  }

  Widget buildNotificationsItem() {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      height: 55,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: MyColors.primaryColor,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: MyColors.deafultColor,
            child:
                Icon(Icons.mode_comment_outlined, color: MyColors.primaryColor),
          ),
          const SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi Mahdy",
                style: TextStyle(
                    color: MyColors.primaryColor, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 4,
              ),
              Text("you have 2 favorites items check them out",
                  style: TextStyle(color: MyColors.primaryColor, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
