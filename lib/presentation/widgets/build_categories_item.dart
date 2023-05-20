import 'package:endless/constant/colors.dart';
import 'package:flutter/material.dart';

class BuildCategoriesItem extends StatelessWidget {
  final String text;

  const BuildCategoriesItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 74,
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          color: MyColors.primaryColor
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: MyColors.primaryColor),
        ),
      ),
    );
  }
}
