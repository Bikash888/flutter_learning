import "package:flutter/material.dart";

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 10;
    String course = "Flutter";
    double hours = 5.5;
    return Scaffold(
      appBar: AppBar(
        title: Text("Grantha"),
      ),
      body: Center(
        child: Container(
          child: Text(
              "Welcome to learning $course,I will complete $course in $days.Each day i will read $hours hrs"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
