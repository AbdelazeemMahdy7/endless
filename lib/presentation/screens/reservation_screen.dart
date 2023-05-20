import 'package:endless/constant/strings.dart';
import 'package:endless/res/deafult_formfield.dart';
import 'package:endless/res/deafult_text.dart';
import 'package:endless/presentation/widgets/text_field_calendar.dart';
import 'package:endless/shared/components.dart';
import 'package:flutter/material.dart';
import '../../constant/colors.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
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
                  buildTopReservationItems(context),
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
                  buildReserveButton(),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTopReservationItems(context) {
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
          width: 50,
        ),
        Text(
          "Reservation",
          style: TextStyle(color: MyColors.primaryColor, fontSize: 25),
        )
      ],
    );
  }

  Widget buildReserveButton() {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
          color: MyColors.deafultColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all()),
      child: MaterialButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, homeScreen);
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
    );
  }
}
