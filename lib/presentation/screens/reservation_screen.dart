import 'package:endless/constant/strings.dart';
import 'package:endless/contorller/app_bloc.dart';
import 'package:endless/contorller/app_states.dart';
import 'package:endless/presentation/widgets/deafult_formfield.dart';
import 'package:endless/presentation/widgets/deafult_text.dart';
import 'package:endless/presentation/widgets/text_field_calendar.dart';
import 'package:endless/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constant/colors.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key, required this.offerId}) : super(key: key);
  final int offerId;

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
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
              child: BlocConsumer<AppBloc, AppStates>(
                listener: (context, state) {
                  if (state is AddReservationSuccessState) {
                    Navigator.popAndPushNamed(context, endlessScreen);
                  }
                },
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTopReservationItems(),
                      Text(
                        "Please fill out this form in order for the reservation \n to be successful",
                        style: TextStyle(
                          color: MyColors.deafultColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      DeafultText(text: "Full Name", fontSize: 18),
                      mySizeBox(),
                      DeafultFormField(
                        hintText: "Enter your name",
                        textInputAction: TextInputAction.next,
                      ),
                      mySizeBox(),
                      DeafultText(text: "Phone", fontSize: 18),
                      mySizeBox(),
                      DeafultFormField(
                        hintText: "Enter your Phone number",
                        textInputAction: TextInputAction.next,
                      ),
                      mySizeBox(),
                      DeafultText(text: "Email", fontSize: 18),
                      mySizeBox(),
                      DeafultFormField(
                        hintText: "Enter your Email",
                        textInputAction: TextInputAction.next,
                      ),
                      mySizeBox(),
                      DeafultText(text: "Date", fontSize: 18),
                      mySizeBox(),
                      const TextFieldCalendar(),
                      const Spacer(),
                      buildReserveButton(onPressed: () {
                        appBloc.addReservation(widget.offerId);
                      }),
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

  Widget buildTopReservationItems() {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, endlessScreen);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: MyColors.primaryColor,
              size: 30,
            )),
        const SizedBox(
          width: 50,
        ),
        Text(
          "Reservation",
          style: TextStyle(color: MyColors.primaryColor, fontSize: 25),
        )
      ],
    );
  }

  Widget buildReserveButton({required VoidCallback onPressed}) {
    return BlocBuilder<AppBloc, AppStates>(
      builder: (context, state) {
        return Container(
          height: 45,
          width: double.infinity,
          decoration: BoxDecoration(
              color: MyColors.deafultColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all()),
          child: MaterialButton(
            onPressed: onPressed,
            child: state is AddReservationLoadingState
                ? const Center(child: CircularProgressIndicator())
                : Text(
                    "Reserve",
                    style: TextStyle(
                      color: MyColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
