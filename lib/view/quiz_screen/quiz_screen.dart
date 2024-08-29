import 'package:flutter/material.dart';
import 'package:quiz_app_sample/dummy_db.dart';
import 'package:quiz_app_sample/view/quiz_screen/widget/options_card.dart';
import 'package:quiz_app_sample/view/result_screen/result_screen.dart';
import 'package:lottie/lottie.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key,
  required this.QuestionList,});
    final List QuestionList;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}   

class _QuizScreenState extends State<QuizScreen> {
  
  int questionIndex=0;
  int? selectedAnswerIndex;
  int rightAnsCount=0;
    int wrongAnswerCount = 0;
    @override
    void initState() {
    Future.delayed(Duration(seconds: 3)).then(
      (value) {
        
      },
    );
  }
  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.black,
     appBar: _buildAppBarSection(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: ListView(
           
            children: [
              //question section
              _buildQuestionSection(),
              SizedBox(height: 20,),
              //option section
              Column(                 
                children: List.generate(
                  4,
                  (index)=> OptionsCard(
                    borderColor:_getColor(index),
                    questionIndex: questionIndex,
                    optionIndex:widget.QuestionList[questionIndex]["option"][index],
                 onOptionsTap: () {
            if (selectedAnswerIndex == null) {
              setState(() {
                selectedAnswerIndex = index;
                if (selectedAnswerIndex ==
                    widget.QuestionList[questionIndex]["answer"]) {
                  rightAnsCount++;
                } else {
                  wrongAnswerCount++;
                }
              });
            }
          },
                    ),
                
                ),),
                SizedBox(height: 20,),
               
            ],
          ),
        ),
      ),
      bottomNavigationBar:
      selectedAnswerIndex!= null? _buildNextButton(context):null,
    );
  }

  AppBar _buildAppBarSection() {
    return AppBar(
    backgroundColor: Colors.black,
    centerTitle: true,
    title: Row(
        children: <Widget>[
          SizedBox(
            width: 220,
            child: LinearProgressIndicator(
              minHeight: 7,
              backgroundColor: Colors.grey,
              value: (questionIndex + 1) / widget.QuestionList.length,
              color: Colors.yellow.shade900,
              borderRadius: BorderRadius.circular(13),
            ),
          ),
        ],
      ),
    actions: [Text("${questionIndex+1}/${widget.QuestionList.length}",
    style: TextStyle(color: Colors.blue),),
    SizedBox(width: 15,)
    ],
   );
  }

  Padding _buildNextButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: InkWell(
        onTap: () {
          selectedAnswerIndex=null;
          if(
            questionIndex<widget.QuestionList.length-1
          ){
            setState(() {
            questionIndex++;
          });
          }else{
            Navigator.push(context,
             MaterialPageRoute(
              builder: (context)=>ResultScreen(
                wrongAnsCount: wrongAnswerCount,
                rightAnsCount: rightAnsCount,
                qstn: widget.QuestionList,
              )
              ));
     
          }
          
        },
        child: Container(
          height: 60,
          child: Center(
            child: Text("Next",
                    style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold),),
          ),
          decoration: BoxDecoration(color: Colors.blue,
          borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Padding _buildQuestionSection() {
    return Padding(
                padding: const EdgeInsets.symmetric(vertical:10 ,),
                child: Expanded(
                  child: Stack(
                    children: [
                      Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                      height: 200,
                      
                      child: SingleChildScrollView(
                        child: Text(widget.QuestionList[questionIndex]["question"],
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.white,fontSize: 20),),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    selectedAnswerIndex==widget.QuestionList[questionIndex]["answer"]
                    ?Lottie.asset('assets/animations/Animation - 1724599992433.json',
                    height: 200,alignment: Alignment.center)
                    :SizedBox()
                    ],
                  ),
                ),
              );
  }

Color _getColor(int index){
  if(selectedAnswerIndex!=null){
      if(index== widget.QuestionList[questionIndex]["answer"]){
    return Colors.green;
  }
  if(selectedAnswerIndex==widget.QuestionList[questionIndex]["answer"] && selectedAnswerIndex==index){
    return Colors.green;
  }else if(selectedAnswerIndex!=widget.QuestionList[questionIndex]["answer"] && selectedAnswerIndex==index){
   return Colors.red;
  }
  }

  return Colors.grey;
}
}

