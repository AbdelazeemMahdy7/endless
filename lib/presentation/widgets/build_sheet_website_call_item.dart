import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class BuildSheetWebsiteCallItem extends StatelessWidget {
  final String text;
  final Widget icon;

  BuildSheetWebsiteCallItem({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 92,
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          color: MyColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 8,
            ),
            Text(
              text,
              style: TextStyle(color: MyColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
