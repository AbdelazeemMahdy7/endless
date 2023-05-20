import 'package:endless/constant/colors.dart';
import 'package:endless/data/models/place_suggestion.dart';
import 'package:flutter/material.dart';


class PlacesItem extends StatelessWidget {
  final PlaceSuggestion suggestion;

   PlacesItem({
    Key? key,
    required this.suggestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var subText=suggestion.description.replaceAll(suggestion.description.split(",")[0],"" );
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(8),
      ),
      color: Colors.white,
      margin: const EdgeInsetsDirectional.all(6),
      padding: const EdgeInsetsDirectional.all(4),
      child: ListTile(
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: MyColors.lightBlue,
            shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.place,
            color: MyColors.blue,
          ),
        ),
        title: RichText(
          text: TextSpan(
           children: [
             TextSpan(
               text: "${suggestion.description.split(",")[0]}/n" ,
               style: const TextStyle(
                 color: Colors.black,
                 fontSize: 18,
                 fontWeight: FontWeight.bold,
               ),
             ),
             TextSpan(
               text: subText.substring(2),
               style: const TextStyle(
                 color: Colors.black,
                 fontSize: 16,
               )
             ),
           ],
          ),

        ),
      ),
    );
  }
}
