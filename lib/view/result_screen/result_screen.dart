import 'package:flutter/material.dart';
import 'package:quiz_app_sample/dummy_db.dart';
import 'package:quiz_app_sample/view/home_screen/home_screen.dart';
import 'package:quiz_app_sample/view/quiz_screen/quiz_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.rightAnsCount});
  final int rightAnsCount;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int starCount=0;
  @override
  void initState(){
    starCount=calPercentage();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => Padding(
                padding: EdgeInsets.only(
                  bottom: index==1? 20 : 0 ,left: 15, right: 15
                ),
                child: Icon(Icons.star,
                color: index <=starCount ? Colors.amber :Colors.grey,
                size: index==1?80 :50,),
                ),)
            ),
            Text("congrats!",
            style: TextStyle(fontSize: 30,color: Colors.white),),
            
            SizedBox(height: 20,),
            Column(
              children: [
                Text("Your Score",
                style: TextStyle(color: Colors.amber),),
                Text("${widget.rightAnsCount}/${DummyDb.quiz.length}",
                style: TextStyle(color: Colors.amber,fontSize: 20),),
                
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    Navigator.push(context,
                     MaterialPageRoute(builder: (context)=>QuizScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                          Container(
                       height: 40,
                      width: 90,
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                            Icon(Icons.replay,color: Colors.white,),
                      SizedBox(width: 10,),
                           Text("Retry",style: TextStyle(color: Colors.white),),
                         ],
                       ),
                                                decoration: BoxDecoration(
                       color: Colors.orange,
                       border: Border.all(width: 2,color: Colors.white),
                       borderRadius: BorderRadius.circular(10)
                                                ),
                                                ),
                      SizedBox(width: 5,),
                      Container(
                        height: 40,
                       width: 40,
                        child: Center(child: IconButton(onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                        },
                         icon: Icon(Icons.home,color: Colors.white,))),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        border: Border.all(width: 2,color: Colors.white),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  calPercentage(){
    double percentage = 
    (widget.rightAnsCount +100)/DummyDb.quiz.length;
    print(percentage);
    if(percentage >= 80){
      return 3;
    }else if(percentage>=50){
      return 2;
    }else if(percentage>=30){
      return 1;
    }else {
      return 0;
    }
  }
}