import 'package:endless/constant/colors.dart';
import 'package:endless/constant/strings.dart';
import 'package:endless/shared/components.dart';
import 'package:flutter/material.dart';

class BestOfferScreen extends StatelessWidget {
  const BestOfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundImage(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTopItem(context, endlessScreen, "Best Offers"),
                  Container(
                    padding: const EdgeInsets.all(6),
                    margin: const EdgeInsets.all(6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildPercentText("10%"),
                        const SizedBox(height: 5),
                        buildScrollItems(),
                        const SizedBox(height: 8),
                        buildPercentText("25%"),
                        const SizedBox(height: 5),
                        buildScrollItems(),
                        const SizedBox(height: 8),
                        buildPercentText("35%"),
                        const SizedBox(height: 5),
                        buildScrollItems(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildScrollItems(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildOffersItems(),
          const SizedBox(width: 8,),
          buildOffersItems(),
          const SizedBox(width: 8,),
          buildOffersItems(),
          const SizedBox(width: 8,),
          buildOffersItems(),
          const SizedBox(width: 8,),
        ],
      ),
    );
  }

  Widget buildOffersItems() {
    return Container(
      height: 120,
      width: 80,
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/4/4a/Mohamed_Salah_2018.jpg"),
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.favorite,
              color: MyColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
