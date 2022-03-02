import 'package:flutter/material.dart';

import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({
    this.buttonTitle,
    this.onTap,
  });
  final String buttonTitle;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bottomContainerColor,
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 80,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            buttonTitle,
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
