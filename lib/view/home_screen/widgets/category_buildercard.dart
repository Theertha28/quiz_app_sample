import 'package:flutter/material.dart';
import 'package:quiz_app_sample/view/quiz_screen/quiz_screen.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CategoryBuilder extends StatelessWidget {
  const CategoryBuilder({
    super.key, 
    required this.category,
     required this.qnumber,
     required this.url,
  });
  final String category;
  final String qnumber;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizScreen()));
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              SizedBox(height: 10),
              Text(
                category,
                style: TextStyle(color: Colors.white, fontSize: 16,
                fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8,),
               Text(
                qnumber,
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right:90,
          child:  SvgPicture.asset(url,height: 70,
          ),)
       
        ]                ),
    );
  }
}
