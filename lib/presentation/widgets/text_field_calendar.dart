import 'package:endless/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextFieldCalendar extends StatefulWidget {
  const TextFieldCalendar({Key? key}) : super(key: key);

  @override
  State<TextFieldCalendar> createState() => _TextFieldCalendarState();
}

class _TextFieldCalendarState extends State<TextFieldCalendar> {
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 55,
      child: TextField(
        controller: _dateController,
        readOnly: true,
        style: TextStyle(color: MyColors.deafultColor),
        decoration: InputDecoration(
          hintText: "Pick a date",
          suffixIcon: Icon(Icons.calendar_month, color: MyColors.primaryColor),
          hintStyle: TextStyle(
              color: MyColors.deafultColor, fontWeight: FontWeight.w200),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: MyColors.primaryColor,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onTap: () async{
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2101),
          );

          if(pickedDate != null){
            String formattedDate =DateFormat("yyyy-MM-dd").format(pickedDate);

            setState((){
              _dateController.text = formattedDate.toString();
            }
            );
          }else{

          }

        },

      ),
    );
  }
}
