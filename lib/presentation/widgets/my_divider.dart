import 'package:endless/constant/colors.dart';
import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
         Expanded(
          child:  Divider(
            thickness: 2,
            color:MyColors.primaryColor ,
          ),
        ),
         Text("       Or       ",style: TextStyle(color: MyColors.primaryColor)),
        Expanded(
          child:  Divider(
            thickness: 2,
            color: MyColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
