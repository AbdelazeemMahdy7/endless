import 'package:endless/constant/colors.dart';
import 'package:endless/constant/strings.dart';
import 'package:endless/contorller/app_bloc.dart';
import 'package:endless/contorller/app_states.dart';
import 'package:endless/core/usecase/use_case.dart';
import 'package:endless/presentation/screens/best_offer_screen.dart';
import 'package:endless/presentation/widgets/build_categories_item.dart';
import 'package:endless/presentation/widgets/build_sheet_website_call_item.dart';
import 'package:endless/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBloc appBloc = AppBloc.get(context);

    appBloc.userProfile(NoParams());
    appBloc.getCompanies(NoParams());
    appBloc.getOffers(params: NoParams());

    return Stack(
      children: [
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: BlocConsumer<AppBloc, AppStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    state is UserProfileLoadingState ||
                            state is CompaniesLoadingState ||
                            state is OffersLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(8),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    buildTopHomeItem(
                                        name: appBloc.userProfileEntity!.name),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    buildSearchNotifactionsItem(context),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    buildBoldText("Categories"),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    buildCategoriesItem(context),
                                    const SizedBox(height: 20),
                                    buildBoldText("Companies"),
                                    const SizedBox(height: 6),
                                    // when click on this inKWell widget will showing bottom sheet
                                    SizedBox(
                                      height: 200,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                            Padding(
                                          padding:
                                              const EdgeInsetsDirectional.only(
                                                  end: 20.0),
                                          child: buildCompanyItem(
                                              name: appBloc
                                                  .companiesList[index].name,
                                              icon:Icons.favorite_border,
                                              image: appBloc
                                                  .companiesList[index].media,
                                              onPressedFavourite: () {
                                                print(appBloc.companiesList[index].favourite!);
                                                appBloc.addFavouriteCompany(
                                                    appBloc
                                                        .companiesList[index]);
                                              }),
                                        ),
                                        itemCount: appBloc.companiesList.length,
                                      ),
                                    ),

                                    const SizedBox(height: 6),
                                    buildDiscoverBox(context),
                                    const SizedBox(height: 6),
                                    buildBoldText("Best Offers"),
                                    const SizedBox(height: 6),
                                    InkWell(
                                      child: Image.asset(
                                          "assets/images/best_offer.jpeg"),
                                      onTap: () {
                                        Navigator.pushReplacementNamed(
                                            context, bestOfferScreen);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCompanyItem({
    required String image,
    required String name,
    required VoidCallback onPressedFavourite,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: 200,
          child: Stack(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover)),
              ),
              BlocBuilder<AppBloc, AppStates>(
                builder: (context, state) {
                  return Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: onPressedFavourite,
                      icon: Icon(
                        icon,
                        color: MyColors.primaryColor,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text(
              name,
              style: TextStyle(color: MyColors.primaryColor, fontSize: 16),
            ),
            const SizedBox(width: 30),
            buildRateStars(),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: MyColors.primaryColor,
              size: 16,
            ),
            Text(
              "Cairo",
              style: TextStyle(color: MyColors.primaryColor),
            )
          ],
        ),
      ],
    );
  }

  Widget buildCategoriesItem(context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BestOfferScreen(),
                ),
              );
            },
            child: const BuildCategoriesItem(
              text: "All",
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BestOfferScreen(
                    eventType: "Wedding",
                  ),
                ),
              );
            },
            child: const BuildCategoriesItem(text: "Wedding"),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BestOfferScreen(
                    eventType: "Birthday Party",
                  ),
                ),
              );
            },
            child: const BuildCategoriesItem(text: "BD Party"),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const BestOfferScreen(eventType: "Graduation Party"),
                ),
              );
            },
            child: const BuildCategoriesItem(text: "Grad Party"),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const BestOfferScreen(eventType: "Baby Party"),
                ),
              );
            },
            child: const BuildCategoriesItem(text: "Baby Party"),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const BestOfferScreen(eventType: "Congress"),
                ),
              );
            },
            child: const BuildCategoriesItem(text: "Congress"),
          ),
        ],
      ),
    );
  }

  Widget buildDiscoverBox(context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      height: 130,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        border:
            Border.all(style: BorderStyle.solid, color: MyColors.primaryColor),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                "Discover Your Map \n and find your way",
                style: TextStyle(
                  color: MyColors.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                    color: MyColors.deafultColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all()),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, mapScreen);
                  },
                  child: Text(
                    "Discover",
                    style: TextStyle(
                      color: MyColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 110,
                height: 110,
                child: Image.asset("assets/images/discover_image.jpeg"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTopHomeItem({required String name}) {
    return Row(
      children: [
        CircleAvatar(
          radius: 34,
          backgroundColor: MyColors.primaryColor,
          child: const CircleAvatar(
            backgroundImage: AssetImage("assets/images/person.jpg"),
            radius: 32,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, $name",
              style: TextStyle(
                color: MyColors.primaryColor,
                fontSize: 14,
              ),
            ),
            Text(
              "Have an unforgettable day with us",
              style: TextStyle(
                  color: MyColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildBoldText(String title) {
    return Text(
      title,
      style: TextStyle(
        color: MyColors.primaryColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildSearchNotifactionsItem(context) {
    return Row(
      children: [
        Expanded(
          flex: 10,
          child: Container(
            height: 50,
            child: TextFormField(
              decoration: InputDecoration(
                iconColor: MyColors.primaryColor,
                focusColor: MyColors.primaryColor,
                hintText: "Search.....",
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: MyColors.primaryColor,
                    )),
                hintStyle: TextStyle(color: MyColors.primaryColor),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.location_on_sharp),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: MyColors.primaryColor),
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, notificationsScreen);
              },
              icon: Icon(
                Icons.notifications,
                color: MyColors.primaryColor,
              )),
        ),
      ],
    );
  }
}
