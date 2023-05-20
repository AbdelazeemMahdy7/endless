import 'package:endless/constant/colors.dart';
import 'package:flutter/material.dart';
import '../constant/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then(
      (value) => Navigator.pushReplacementNamed(context, onBoarding),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
                image: AssetImage("assets/images/logo.jpeg"), width: 250),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Endless Events",
              style: TextStyle(
                color: MyColors.primaryColor,
                fontSize: 25,
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
      ),
    );
  }
}
