import 'package:flutter/material.dart';

import '../constant/colors.dart';

class DeafultFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  FormFieldValidator<String>? validator;
  ValueChanged<String>? onFieldSubmitted;
  TextInputType? textInputType;

  DeafultFormField({
    Key? key,
    this.validator,
    this.onFieldSubmitted,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputAction,
    this.controller,
    this.textInputType
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 55,
      child: TextFormField(
        cursorColor: MyColors.primaryColor,
        textInputAction: textInputAction,
        controller: controller,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        keyboardType: textInputType,
        decoration: InputDecoration(

          iconColor: MyColors.primaryColor,
          focusColor: MyColors.primaryColor,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: MyColors.primaryColor,
            ),
          ),
          hintStyle: TextStyle(color: MyColors.primaryColor,fontWeight: FontWeight.w200),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
