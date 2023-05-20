import 'package:endless/constant/colors.dart';
import 'package:endless/constant/strings.dart';
import 'package:endless/shared/components.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

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
                children: [
                  buildTopFavoriteItems(context),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      print('clear item');
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "Clear all",
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: MyColors.primaryColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  buildFavoriteItem(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTopFavoriteItems(context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, endlessScreen);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: MyColors.primaryColor,
              size: 30,
            )),
        const SizedBox(
          width: 80,
        ),
        Text(
          "Favorite",
          style: TextStyle(color: MyColors.primaryColor, fontSize: 25),
        )
      ],
    );
  }

  Widget buildFavoriteItem(){
    return  Container(
      width: 380,
      height: 150,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/3/3f/Fronalpstock_big.jpg"),
              buildDetailesItem(),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: MyColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetailesItem() {
    return Container(
      width: 380,
      height: 40,
      decoration: BoxDecoration(
        color: MyColors.deafultColor,
        border: Border.all(color: MyColors.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: Text(
                  "Reta Ropens",
                  style: TextStyle(
                    color: MyColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: MyColors.primaryColor,
                    size: 20,
                  ),
                  // location text
                  Text("Cairo",
                      style: TextStyle(
                          color:
                          MyColors.primaryColor)),
                  const SizedBox(width: 3),
                  Container(
                    decoration: BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: buildRateStars(),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete,
              color: MyColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
