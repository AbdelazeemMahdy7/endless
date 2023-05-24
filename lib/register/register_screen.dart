import 'package:endless/constant/strings.dart';
import 'package:endless/contorller/app_bloc.dart';
import 'package:endless/contorller/app_states.dart';
import 'package:endless/domain/usecase/register_usecase.dart';
import 'package:endless/res/deafult_formfield.dart';
import 'package:endless/shared/components.dart';
import 'package:endless/res/deafult_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constant/colors.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool userClick = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    AppBloc appBloc = AppBloc.get(context);

    return Stack(
      children: [
        backgroundImage(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: BlocConsumer<AppBloc,AppStates>(
              listener: (context, state) => (){
                if(state is RegisterSuccessState){
                  Navigator.pushReplacementNamed(context, loginScreen);
                }
              },
              builder: (context, state) => Container(
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
                        validator: (value){
                          if (value!.isEmpty) {
                            return "Name Required";
                          }
                          return null;
                        },
                        controller: nameController,
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
                        controller: emailController,
                      ),
                      const SizedBox(height: 14),
                      DeafultFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Phone Required";
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        hintText: "Enter your Phone",
                        controller: phoneController,
                        textInputType: TextInputType.number,
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
                        controller: passwordController,
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
                              appBloc.registerUseCase(RegisterParams(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                password: passwordController.text
                              ));
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
        ),
      ],
    );
  }
}
