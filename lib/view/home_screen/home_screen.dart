import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
         
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical:10 ),
              child: Container(
                height: 200,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("What is the most popular sport throughout the world?",
                  style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}