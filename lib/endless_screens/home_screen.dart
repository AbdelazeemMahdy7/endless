import 'package:endless/constant/colors.dart';
import 'package:endless/constant/strings.dart';
import 'package:endless/contorller/app_bloc.dart';
import 'package:endless/contorller/app_states.dart';
import 'package:endless/core/usecase/use_case.dart';
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
    appBloc.getOffers(NoParams());

    return Stack(
      children: [
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: BlocConsumer<AppBloc, AppStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildTopHomeItem(),
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
                        buildCategoriesItem(),
                        const SizedBox(height: 20),
                        buildBoldText("Companies"),
                        const SizedBox(height: 6),
                        // when click on this inKWell widget will showing bottom sheet
                        ListView.builder(
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                appBloc.getCompanyImages(
                                    appBloc.companiesList[index].id!);
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  builder: (context) => state
                                          is GetCompanyImagesLoadingState
                                      ? Container(
                                          color: Colors.white,
                                          height: 100,
                                          child: const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        )
                                      : buildSheet(
                                          context,
                                          name:
                                              appBloc.companiesList[index].name,
                                          phone: appBloc
                                              .companiesList[index].phone,
                                          companyId:
                                              appBloc.companiesList[index].id!,
                                          images: appBloc.companyImages,
                                        ),
                                );
                              },
                              child: buildCompanyItem(
                                name: appBloc.companiesList[index].name,
                                image: appBloc.companiesList[index].media,
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 6),
                        buildDiscoverBox(context),
                        const SizedBox(height: 6),
                        buildBoldText("Best Offers"),
                        const SizedBox(height: 6),
                        InkWell(
                          child: Image.asset("assets/images/best_offer.jpeg"),
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, bestOfferScreen);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCompanyItem({required String image, required String name}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 130,
          width: 200,
          child: Stack(
            children: [
              Image.network(image, fit: BoxFit.cover),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: MyColors.primaryColor,
                  ),
                ),
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

  Widget buildCategoriesItem() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          BuildCategoriesItem(
            text: "All",
          ),
          SizedBox(width: 8),
          BuildCategoriesItem(text: "Wedding"),
          SizedBox(width: 8),
          BuildCategoriesItem(text: "BD Party"),
          SizedBox(width: 8),
          BuildCategoriesItem(text: "Grad Party"),
          SizedBox(width: 8),
          BuildCategoriesItem(text: "Baby Party"),
          SizedBox(width: 8),
          BuildCategoriesItem(text: "Congress"),
        ],
      ),
    );
  }

  Widget buildDiscoverBox(context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      height: 130,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        border:
            Border.all(style: BorderStyle.solid, color: MyColors.primaryColor),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
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

  Widget buildTopHomeItem() {
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
              "Hi,Mahdy",
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

  Widget buildSheet(
    context, {
    required String name,
    required List<String> images,
    required String phone,
    required int companyId,
  }) {
    return SizedBox(
      height: 565,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Reta Ropenes",
              style: TextStyle(
                  fontSize: 25,
                  color: MyColors.primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                buildRateStars(),
                Text(
                  "Event Planner in Cairo",
                  style: TextStyle(
                      fontSize: 18,
                      color: MyColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  height: 100,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: MyColors.primaryColor,
                    ),
                  ),
                  child: Image.network(
                      fit: BoxFit.cover,
                      "https://upload.wikimedia.org/wikipedia/commons/4/41/Sunflower_from_Silesia2.jpg"),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: MyColors.primaryColor,
                    ),
                  ),
                  height: 100,
                  width: 85,
                  child: Image.network(
                      fit: BoxFit.cover,
                      "https://upload.wikimedia.org/wikipedia/commons/c/c9/Moon.jpg"),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: MyColors.primaryColor,
                    ),
                  ),
                  height: 100,
                  width: 85,
                  child: Image.network(
                      fit: BoxFit.cover,
                      "https://upload.wikimedia.org/wikipedia/commons/c/c9/Moon.jpg"),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildSheetWebsiteCallItem(
                  text: "WebSite",
                  icon: Icon(
                    Icons.map_outlined,
                    color: MyColors.primaryColor,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                BuildSheetWebsiteCallItem(
                  text: "Favorite",
                  icon: Icon(
                    Icons.favorite,
                    color: MyColors.primaryColor,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                BuildSheetWebsiteCallItem(
                  text: "Call",
                  icon: Icon(
                    Icons.call,
                    color: MyColors.primaryColor,
                    size: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            dividerSheet(),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Overview",
                style: TextStyle(
                  color: MyColors.primaryColor,
                  fontSize: 20,
                ),
              ),
            ),
            dividerSheet(),
            buildOverviewDetailes(),
            dividerSheet(),
            buildQuistionsAndAnswers(),
            dividerSheet(),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: MyColors.deafultColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all()),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, reservationScreen);
                },
                child: Text(
                  "Reserve",
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
      ),
    );
  }

  Widget buildQuistionsAndAnswers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Questions & Answers",
          style: TextStyle(
              color: MyColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        const SizedBox(height: 4),
        Text(
          "Be the first to ask a question",
          style: TextStyle(
            color: MyColors.deafultColor,
          ),
        ),
        const SizedBox(height: 6),
        Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            width: 150,
            child: BuildSheetWebsiteCallItem(
              text: "Ask a question",
              icon: Icon(
                Icons.mark_unread_chat_alt_sharp,
                color: MyColors.deafultColor,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget overviewDeafultTexts(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 18,
          color: MyColors.primaryColor,
          fontWeight: FontWeight.bold),
    );
  }

  Widget buildOverviewDetailes() {
    return Column(
      children: [
        Row(
          children: [
            overviewDeafultTexts("Address :"),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                "Qasr Ad Dobarah,Abdeen,Cairo Goverment",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: MyColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            overviewDeafultTexts("Area saves :"),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                "Alexandria and nearby areas",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: MyColors.deafultColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            overviewDeafultTexts("Hours :"),
            const SizedBox(width: 6),
            const Text(
              "opens",
              style: TextStyle(color: Colors.green),
            ),
            const SizedBox(width: 6),
            Text("Closes 9 am",
                style: TextStyle(
                  color: MyColors.primaryColor,
                  fontWeight: FontWeight.w300,
                )),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            overviewDeafultTexts("phone :"),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                "01552983126",
                style: TextStyle(
                  fontSize: 14,
                  color: MyColors.deafultColor,
                ),
              ),
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
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.location_on_sharp),
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

  Widget dividerSheet() {
    return Divider(
      color: MyColors.primaryColor,
      thickness: 1,
    );
  }
}
