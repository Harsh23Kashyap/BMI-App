import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/result.dart';
import 'package:bmi_calculator/round_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'parts_all.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xff0a0e21),
      ),
      body: Center(
        child: Properties(),
      ),
    );
  }
}

class Properties extends StatefulWidget {
  @override
  _PropertiesState createState() => _PropertiesState();
}

class _PropertiesState extends State<Properties> {
  Color femaleCardColor = inactiveCardColour;
  Color maleCardColor = inactiveCardColour;
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: Parts(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                colour: selectedGender == Gender.male
                    ? activeCardColour
                    : inactiveCardColour,
                cardChild:
                    IconContent(icon: FontAwesomeIcons.mars, labelled: "Male"),
              ),
            ),
            Expanded(
              child: Parts(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                colour: selectedGender == Gender.female
                    ? activeCardColour
                    : inactiveCardColour,
                cardChild: IconContent(
                    icon: FontAwesomeIcons.venus, labelled: "Female"),
              ),
            ),
          ],
        )),
        Expanded(
          child: Parts(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Height",
                  style: label,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: sliderstyle,
                    ),
                    Text(
                      "  cm",
                      style: label,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.pink,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Color(0xFFEB1555),
                      overlayColor: Color(0x15EB1555),
                      rangeThumbShape:
                          RoundRangeSliderThumbShape(enabledThumbRadius: 20.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 20)),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newVal) => {
                      setState(() {
                        height = newVal.round();
                      }),
                    },
                  ),
                ),
              ],
            ),
            colour: activeCardColour,
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Parts(
                  colour: activeCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Weight",
                        style: label,
                      ),
                      Text(
                        weight.toString(),
                        style: sliderstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                if (weight > 0) weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Parts(
                  colour: activeCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Age",
                        style: label,
                      ),
                      Text(
                        age.toString(),
                        style: sliderstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (age > 0) age--;
                                });
                              }),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (age < 120) age++;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        BottomButton(
          buttonTitle: "Calculate",
          onTap: () {
            CalculatorBrain calc =
                CalculatorBrain(height: height, weight: weight);
            String num = calc.calculateBMI();
            String verdict = calc.getResult();
            String suggest = calc.getSuggestion();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ResultPage(
                    num: num,
                    ans: verdict,
                    suggest: suggest,
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
