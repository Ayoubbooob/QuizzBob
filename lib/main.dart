import 'package:flutter/material.dart';
import 'package:quizzbob_app/quizzbob_widget.dart';

void main() => runApp(const Quizzbob());

class Quizzbob extends StatelessWidget {
  const Quizzbob({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        backgroundColor: Color(0XFF303030),
        body: QuizzbobWidget(),
      )),
    );
  }
}
