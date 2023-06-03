import 'package:endless/constant/colors.dart';
import 'package:flutter/material.dart';

class DeafultText extends StatelessWidget {
  final String text;
  final double? fontSize;

  DeafultText({
    Key? key,
    required this.text,
    this.fontSize,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Text(
        text,
        style:  TextStyle(
          color: MyColors.primaryColor,
          fontSize: fontSize ,
        ),
      ),
    );
  }
}
