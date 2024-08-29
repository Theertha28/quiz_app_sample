import 'package:flutter/material.dart';
import 'package:quiz_app_sample/dummy_db.dart';

class OptionsCard extends StatelessWidget {
  const OptionsCard({
    super.key,
    required this.questionIndex,
    required this. optionIndex,
    this.onOptionsTap,
    required this.borderColor,
  });

  final int questionIndex;
   final String optionIndex;
   final void Function()? onOptionsTap;
   final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: onOptionsTap,
        child: Container(
        
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                           
        child: Row( 
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(optionIndex,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            CircleAvatar(
              radius: 10,
              child: CircleAvatar(
                radius: 9,
                backgroundColor: Colors.black,
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: borderColor)
        ),
                          ),
      ),
    );
  }
}