import 'package:flutter/material.dart';
import 'package:quiz_app_sample/dummy_db.dart';
import 'package:quiz_app_sample/view/home_screen/widgets/category_buildercard.dart';
import 'package:quiz_app_sample/view/quiz_screen/quiz_screen.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi, John",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "Let's make this day productive",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                "assets/images/person2.jpeg",
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    FaIcon(FontAwesomeIcons.trophy,color: Colors.amber,size: 30,), 
                    SizedBox(width: 15,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ranking",style: TextStyle(color: Colors.white),),
                        SizedBox(height: 8,),
                        Text("348",
                        style: TextStyle(color: Colors.green.shade400,fontSize: 18,
                        fontWeight: FontWeight.bold),),
                       
                      ],
                    ),
                     SizedBox(width: 55,),
                    SizedBox(
                    height: 41,
                     child:
                      VerticalDivider(
                         color: Color(0xff8C8787),
                         width: 1,
                         thickness: 1,
                       ),
                   ),
                   SizedBox(width: 20,),
                     FaIcon(FontAwesomeIcons.coins,color: Colors.amber,size: 30,), 
                    SizedBox(width: 15,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Points",style: TextStyle(color: Colors.white),),
                        SizedBox(height: 8,),
                        Text("1209",
                        style: TextStyle(color: Colors.green.shade400,fontSize: 18,
                        fontWeight: FontWeight.bold),),
                       
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Let's Play",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: DummyDb.quiz.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.5,
                  mainAxisExtent: 200
             
                ),
                itemBuilder: (context, index) => CategoryBuilder(
                  category: DummyDb.quiz[index]["category"],
                  Questions: DummyDb.quiz[index]["Questions"],
                  url: DummyDb.quiz[index]["url"],
                 onGridTap: (){
                  Navigator.push(
                    context,
                   MaterialPageRoute(
                    builder: (context)=>QuizScreen(
                      QuestionList: DummyDb.quiz[index]["Qlist"])));
                 },
                  
                   
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

