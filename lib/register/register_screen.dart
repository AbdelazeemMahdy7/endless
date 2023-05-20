import 'package:endless/constant/strings.dart';
import 'package:endless/res/deafult_formfield.dart';
import 'package:endless/shared/components.dart';
import 'package:endless/res/deafult_text.dart';
import 'package:flutter/material.dart';

import '../constant/colors.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool userClick = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundImage(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child:  Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: MyColors.primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    DeafultText(
                      text: "Full Name",
                    ),
                    DeafultFormField(
                      textInputAction: TextInputAction.next,
                      hintText: "Enter Full Name",
                    ),
                    const SizedBox(height: 14),
                    DeafultText(
                      text: "Email",
                    ),
                    DeafultFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email Required";
                        }
                        if (!value.contains("@") && !value.contains(".")) {
                          return "Email Valid";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      hintText: "Enter your Email",
                    ),
                    const SizedBox(height: 14),
                    DeafultText(
                      text: "Password",
                    ),
                    DeafultFormField(
                      validator: (value) {
                        if (value!.length < 8) {
                          return "Password must Have a 8 Characters";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      suffixIcon:  Icon(Icons.lock,color: MyColors.primaryColor),
                      hintText: "Enter your Password",
                    ),
                    const SizedBox(height: 14),
                    DeafultText(
                      text: " ConfirmPassword",
                    ),
                    DeafultFormField(
                      validator: (value) {
                        if (value!.length < 8) {
                          return "Password must Have a 8 Characters";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      suffixIcon:  Icon(Icons.lock,color: MyColors.primaryColor),
                      hintText: "Confirm your Password",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            activeColor: MyColors.primaryColor,
                            focusColor:MyColors.primaryColor,
                            value: userClick,
                            onChanged: (value) {
                              setState(() {
                                userClick = value!;
                              });
                            }),
                         Text(
                          "I agree with terms and conditions",
                          style: TextStyle(fontSize: 17,color: MyColors.primaryColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: MyColors.deafultColor,
                        ),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {

                          }

                        },
                        child:  Text("Sign Up",style: TextStyle(color: MyColors.primaryColor),),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text(
                          "Already have an account?",
                          style: TextStyle(color: MyColors.primaryColor),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, loginScreen);
                          },
                          child:  Text("Sign Up",
                              style: TextStyle(color: MyColors.deafultColor)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
