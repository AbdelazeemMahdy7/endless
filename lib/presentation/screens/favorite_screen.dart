import 'package:endless/constant/colors.dart';
import 'package:endless/constant/strings.dart';
import 'package:endless/contorller/app_bloc.dart';
import 'package:endless/contorller/app_states.dart';
import 'package:endless/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBloc appBloc = AppBloc.get(context);
    return Stack(
      children: [
        backgroundImage(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              child: BlocBuilder<AppBloc, AppStates>(
                builder: (context, state) {
                  return Column(
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
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: buildFavoriteItem(
                                name: appBloc.favouriteList[index].name,
                                image: appBloc.favouriteList[index].media,
                              onPressed: (){
                                  appBloc.removeFavouriteCompany(index);
                              }
                            ),
                          ),
                          itemCount: appBloc.favouriteList.length,
                        ),
                      )
                    ],
                  );
                },
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

  Widget buildFavoriteItem({required String image, required String name,required VoidCallback onPressed}) {
    return Container(
      width: double.infinity,
      height: 240,

      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20) ),
                image: DecorationImage(image: NetworkImage(image),fit: BoxFit.cover)
            ),
          ),
          buildDetailesItem(name: name,onPressed: onPressed),

        ],
      ),
    );
  }

  Widget buildDetailesItem({required String name,required VoidCallback onPressed}) {
    return Container(
      width: 380,
      height: 40,
      decoration: BoxDecoration(
        color: MyColors.deafultColor,
        border: Border.all(color: MyColors.primaryColor),
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight:  Radius.circular(10)),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: Text(
                  name,
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
                  Text("Cairo", style: TextStyle(color: MyColors.primaryColor)),
                  const SizedBox(width: 3),
                  Container(
                    decoration: BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: buildRateStars(),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.favorite,
              color: MyColors.primaryColor,
            ),
          ),
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
