import 'package:endless/constant/colors.dart';
import 'package:flutter/material.dart';

class BuildProfileSettingsItems extends StatelessWidget {
  BuildProfileSettingsItems({
    Key? key,
    required this.text,
    required this.icon,
    this.fontWeight,
  }) : super(key: key);

  final String text;
  final Widget icon;
   FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: MyColors.primaryColor,
        ),
      ),
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style:  TextStyle(
              color: MyColors.primaryColor,
              fontSize: 22,
              fontWeight: fontWeight,
            ),
          ),
          const Spacer(),
           Icon(Icons.arrow_forward_ios_rounded,color: MyColors.primaryColor), //this Icon is not change
        ],
      ),
    );
  }
}
