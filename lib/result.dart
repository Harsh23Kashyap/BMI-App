import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

import 'parts_all.dart';

class ResultPage extends StatelessWidget {
  String num;
  String ans;
  String suggest;
  ResultPage({this.num, this.ans, this.suggest});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
        toolbarOpacity: 1.0,
        backgroundColor: Color(0xff0a0e21),
      ),
      backgroundColor: Color(0x770a0e21),
      body: Data(num: num, ans: ans, suggest: suggest),
    );
  }
}

class Data extends StatelessWidget {
  String num;
  String ans;
  String suggest;
  Data({this.num, this.ans, this.suggest});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 50),
        Text(
          "And your BMI is : ",
          style: sliderstyle,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 90),
            child: Expanded(
              child: Parts(
                colour: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      ans,
                      style: TextStyle(color: Colors.green, fontSize: 26),
                    ),
                    Text(
                      num,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 115,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      suggest,
                      style: TextStyle(color: Colors.grey, fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        BottomButton(
          buttonTitle: "Re - Calculate",
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
