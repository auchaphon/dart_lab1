import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  Question(this.questionText);

  Widget build(BuildContext context) {
    return Container(
        child: Text(
          this.questionText,
          style: TextStyle(
              fontSize: 28, color: Colors.red, fontWeight: FontWeight.w700),
          textAlign: TextAlign.left,
        ),
        width: double.infinity,
        margin: EdgeInsets.all(10));
  }
}
