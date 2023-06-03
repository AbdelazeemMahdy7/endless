import 'package:endless/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget backgroundImage() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/background.jpeg"),
        fit: BoxFit.cover,
      ),
    ),
  );
}


Widget buildRateStars() {
  return RatingBar.builder(
    itemBuilder: (context, _) => Icon(Icons.star, color: MyColors.deafultColor),
    onRatingUpdate: (index) {},
    itemSize: 16,
    maxRating: 5,
    minRating: 3,
    initialRating: 4,
  );
}

Widget buildTopItem(context, String route, String title) {
  return Row(
    children: [
      IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, route);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: MyColors.primaryColor,
            size: 30,
          )),
      const SizedBox(
        width: 70,
      ),
      Text(
        title,
        style: TextStyle(color: MyColors.primaryColor, fontSize: 25),
      ),
    ],
  );
}

Widget buildPercentText(String text) {
  return Text(
    text,
    style: TextStyle(
      color: MyColors.primaryColor,
      fontSize: 35,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget mySizeBox(){
  return const SizedBox(height: 8);
}

