import 'package:endless/constant/colors.dart';
import 'package:endless/constant/strings.dart';
import 'package:endless/data_source/models/onBoarding_model.dart';
import 'package:endless/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardingModel> boarding = [
    OnBoardingModel(
      image: "assets/images/onboardingOne.jpeg",
      text: "Exploring Amazing Places\n to Book your Special\n Events Near to you ",
    ),
    OnBoardingModel(
      image: "assets/images/onboardingTwo.jpeg",
      text: "Book your Events Easily to Your Calender ",
    ),
    OnBoardingModel(
      image: "assets/images/onboardingThree.jpeg",
      text: "Trust  \n Endless Events ",
    ),
  ];

  var boardController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundImage(),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, loginScreen);
                    },
                    child:  Text(
                      "Skip", style: TextStyle(color: MyColors.primaryColor),)
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: boardController,
                    itemBuilder: (context, index) =>
                        buildBoardingItem(boarding[index]),
                    itemCount: boarding.length,
                    onPageChanged: (int index) {
                      if (index == boarding.length - 1) {
                        setState((){
                          isLast = true;
                        }
                        );
                      }else{
                        setState((){
                          isLast = false;
                        }
                        );
                      }
                    },
                  ),
                ),
                SmoothPageIndicator(
                  controller: boardController,
                  effect:  ExpandingDotsEffect(
                    dotColor: MyColors.primaryColor,
                    activeDotColor: MyColors.deafultColor,
                    dotWidth: 10,
                    spacing: 5.0,
                    expansionFactor: 4,
                    dotHeight: 10,
                  ),
                  count: boarding.length,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if(isLast){
                        Navigator.pushReplacementNamed(context, loginScreen);
                      }
                      boardController.nextPage(
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.fastLinearToSlowEaseIn);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(110, 50),
                      primary: MyColors.deafultColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text("Next"),
                  ),
                ),
              ],
            )
        ),
      ],
    );
  }

  Widget buildBoardingItem(OnBoardingModel model) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Image(
            image: AssetImage(model.image),
          ),
          //Indicator
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.center,
            child: Text(
              model.text,
              style:  TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: MyColors.primaryColor),
            ),
          ),
         const Spacer(),


        ],
      ),
    );
  }
}
