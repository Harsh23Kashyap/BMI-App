import 'package:flutter/material.dart';

import 'input_page.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.1),
            Image.asset(
              'images/yoga.png',
              width: size.width * 0.9,
            ),
            Text(
              "WELCOME TO BMI CALCULATOR",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.05),
            SizedBox(height: size.height * 0.05),
            SizedBox(
              width: 100, // <-- Your width
              height: 50,
              child: RaisedButton(
                color: Colors.purple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                splashColor: Colors.white,
                hoverColor: Colors.pink, // background
                textColor: Colors.white, // foreground
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return InputPage();
                      },
                    ),
                  );
                },
                child: Text(
                  'Enter',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
