import 'package:endless/constant/colors.dart';
import 'package:endless/constant/strings.dart';
import 'package:endless/contorller/app_bloc.dart';
import 'package:endless/contorller/app_states.dart';
import 'package:endless/core/di/injection.dart';
import 'package:endless/core/network/local/cache_helper.dart';
import 'package:endless/domain/usecase/login_usecase.dart';
import 'package:endless/presentation/widgets/deafult_formfield.dart';
import 'package:endless/shared/components.dart';
import 'package:endless/presentation/widgets/deafult_text.dart';
import 'package:endless/presentation/widgets/my_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppBloc appBloc = AppBloc.get(context);

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Stack(
      children: [
        backgroundImage(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: BlocConsumer<AppBloc, AppStates>(
              listener: (context, state) {
                if (state is LogInSuccessState) {
                  sl<CacheHelper>().put('token', state.logInEntity.token);
                  token = state.logInEntity.token;
                  print(token);
                  Navigator.pushReplacementNamed(context, endlessScreen);
                }
              },
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    state is LogInLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : Expanded(
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(10),
                              child: ListView(
                                children:[ Form(
                                  key: formkey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      signInText(),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      loginEmailAndPassword(
                                          emailController: emailController,
                                          passwordController: passwordController),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      buildSignINButton(context, () {
                                        if (formkey.currentState!.validate()) {
                                          appBloc.logIn(LogInParams(
                                              email: emailController.text,
                                              password: passwordController.text));
                                        }
                                      }),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const MyDivider(),
                                      const SizedBox(height: 15),
                                      signFacebookAndGoogle(),
                                      const SizedBox(height: 20),
                                      buildSignInRow(context),
                                    ],
                                  ),
                                )],
                              ),
                            ),
                        ),
                  ],
                );
              },
            ),
          ),
        )
      ],
    );
  }

  Widget buildSignINButton(context, VoidCallback onPressed) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
          color: MyColors.deafultColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all()),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          "Sign In",
          style: TextStyle(
            color: MyColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget buildSignInRow(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have ana account ?  ",
          style: TextStyle(color: MyColors.primaryColor),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, registerScreen);
          },
          child:
              Text("Sign In", style: TextStyle(color: MyColors.deafultColor)),
        ),
      ],
    );
  }

  Widget loginEmailAndPassword(
      {required TextEditingController emailController,
      required TextEditingController passwordController}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        DeafultText(text: "Password"),
        DeafultFormField(
          validator: (value) {
            if (value!.length < 8) {
              return "Password must Have a 8 Characters";
            }
            return null;
          },
          textInputAction: TextInputAction.done,
          suffixIcon:
              Icon(Icons.remove_red_eye_outlined, color: MyColors.primaryColor),
          hintText: "Enter your password",
          controller: passwordController,
        ),
      ],
    );
  }

  Widget signInText() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Sign In",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: MyColors.primaryColor,
        ),
      ),
    );
  }

  Widget signFacebookAndGoogle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: MyColors.primaryColor,
            ),
            shape: BoxShape.rectangle,
          ),
          child: Icon(
            Icons.facebook,
            size: 40,
            color: MyColors.primaryColor,
          ),
        ),
        const SizedBox(
          width: 40,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: MyColors.primaryColor,
            ),
            shape: BoxShape.rectangle,
          ),
          child: Icon(
            Icons.email,
            size: 40,
            color: MyColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
