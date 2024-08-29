import 'package:flutter/material.dart';
import 'package:quiz_app_sample/dummy_db.dart';
import 'package:quiz_app_sample/view/home_screen/home_screen.dart';
import 'package:quiz_app_sample/view/quiz_screen/quiz_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key,
   required this.rightAnsCount,
    required this.wrongAnsCount,
     required this.qstn});
  final int rightAnsCount;
   final int wrongAnsCount;
   final List qstn;


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
            
            _buildStarViewSection(starCount: starCount),
            SizedBox(height: 10,),
            Text( _getString(),
            style: TextStyle(fontSize: 28,color: Colors.white),),
            
            SizedBox(height: 20,),
            Column(
              children: [
                Text("Your Score",
                style: TextStyle(color: Colors.amber,fontSize: 20),),
                Text("Right Answers: ${widget.rightAnsCount}",
                style: TextStyle(color: Colors.white,fontSize: 15),),
                 Text("Wrong Answers: ${widget.wrongAnsCount}",
                style: TextStyle(color: Colors.white,fontSize: 15),),
                
                
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    Navigator.push(context,
                     MaterialPageRoute(builder: (context)=>QuizScreen(
                  QuestionList: widget.qstn,
                     )));
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
                          Navigator.pushReplacement(
                            context, 
                          MaterialPageRoute(builder: (context)=>HomeScreen()));
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

 int calPercentage(){
    double percentage = 
    (widget.rightAnsCount +100)/widget.qstn.length;
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
  
  String _getString() {
    double scorePercentage =
        (widget.rightAnsCount / widget.qstn.length) * 100;
    if (scorePercentage >= 45) {
      if (scorePercentage >= 80) {
        return "Congratulations !";
      } else {
        return "Average !";
      }
    }
    return "Better luck next time !";}
}

class _buildStarViewSection extends StatelessWidget {
  const _buildStarViewSection({
    super.key,
    required this.starCount,
  });

  final int starCount;

  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) => Padding(
        padding: EdgeInsets.only(
          bottom: index==1? 20 : 0 ,left: 5, right: 5
        ),
        child: Icon(Icons.star,
        color: index <=starCount ? Colors.amber :Colors.grey,
        size: index==1?80 :50,),
        ),)
    );
  }
}