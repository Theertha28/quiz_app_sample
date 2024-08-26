import 'package:flutter/material.dart';
import 'package:quiz_app_sample/view/home_screen/home_screen.dart';
import 'package:quiz_app_sample/view/quiz_screen/quiz_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then(
      (value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child:Text("QUIZ APP",
      style: TextStyle(
        fontWeight: FontWeight.bold,fontSize: 30,
        color: Colors.white),)),
    );
  }
}