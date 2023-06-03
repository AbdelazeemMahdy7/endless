import 'package:endless/constant/colors.dart';
import 'package:endless/constant/strings.dart';
import 'package:endless/contorller/app_bloc.dart';
import 'package:endless/contorller/app_states.dart';
import 'package:endless/core/usecase/use_case.dart';
import 'package:endless/presentation/screens/reservation_screen.dart';
import 'package:endless/presentation/widgets/build_sheet_website_call_item.dart';
import 'package:endless/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestOfferScreen extends StatelessWidget {
  const BestOfferScreen({Key? key,this.eventType}) : super(key: key);

  final String? eventType;

  @override
  Widget build(BuildContext context) {
    AppBloc appBloc = AppBloc.get(context);
    if(eventType != null){
      appBloc.getOffers(event: eventType!);
    }else{
      appBloc.getOffers(params: NoParams());
    }
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
                    buildTopItem(context, endlessScreen, eventType??"Best Offers"),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlocConsumer<AppBloc, AppStates>(
                            listener: (context, state) {
                              if (state is GetCompanySuccessState) {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  builder: (context) => buildSheet(context,
                                      site: state.companyEntity.site,
                                      name: state.companyEntity.name,
                                      phone: state.companyEntity.phone,
                                      offerId: appBloc
                                          .offersList[appBloc.offerIndex!].id,
                                      image: appBloc.companyEntity!.media),
                                );
                              }
                            },
                            builder: (context, state) {
                              return state is OffersLoadingState
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
                                        margin: const EdgeInsets.all(6),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: ListView.builder(
                                                itemBuilder: (context, index) =>
                                                    Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      appBloc.getCompany(appBloc.offersList[index].companyId!);
                                                      appBloc
                                                          .getOfferIndex(index);
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        border: Border.all(
                                                            color: MyColors
                                                                .primaryColor,
                                                            width: 2),
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            height: 150,
                                                            width: double.infinity,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(20),
                                                              image: DecorationImage(image: NetworkImage(appBloc.offersList[index].placeImage),fit: BoxFit.cover)
                                                            ),
                                                          ),
                                                          const SizedBox(height: 10,),
                                                          Text(
                                                              appBloc
                                                                  .offersList[
                                                                      index]
                                                                  .companyName!,
                                                              style: TextStyle(
                                                                  color: MyColors
                                                                      .primaryColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      24)),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                              "Details: ${appBloc.offersList[index].details}",
                                                              style: TextStyle(
                                                                  color: MyColors
                                                                      .primaryColor,
                                                                  fontSize:
                                                                      20)),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                              "Price: ${appBloc.offersList[index].price}",
                                                              style: TextStyle(
                                                                  color: MyColors
                                                                      .primaryColor,
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                itemCount:
                                                    appBloc.offersList.length,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ],
    );
  }

  Widget buildSheet(
    context, {
    required String name,
    required String phone,
    required String site,
    required int offerId,
    required String image,
  }) {
    print('offerId =============>>>>>>>>>>>>>>>>$offerId');
    return SizedBox(
      height: 620,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              name,
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
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: MyColors.primaryColor,
                  ),
                  image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(image))
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildSheetWebsiteCallItem(
                  text: 'Website',
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
            buildOverviewDetailes(phone: phone, site: site),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReservationScreen(
                          offerId: offerId,
                        ),
                      ));
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

  Widget dividerSheet() {
    return Divider(
      color: MyColors.primaryColor,
      thickness: 1,
    );
  }

  Widget buildOverviewDetailes({
    required String phone,
    required String site,
  }) {
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
            overviewDeafultTexts("Website: "),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                site,
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
                phone,
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

  Widget overviewDeafultTexts(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 18,
          color: MyColors.primaryColor,
          fontWeight: FontWeight.bold),
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
}
