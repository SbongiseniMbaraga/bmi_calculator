import 'package:flutter/material.dart';
import 'ReusableCard.dart';
import 'icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'BMI CALCULATOR',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        elevation: 1,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: ReusableCard(
                  newColor: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: const ReusableIcon(
                    newIcon: FontAwesomeIcons.mars,
                    gender: 'MALE',
                  ),
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: ReusableCard(
                  newColor: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: const ReusableIcon(
                    newIcon: FontAwesomeIcons.venus,
                    gender: 'FEMALE',
                  ),
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                ),
              ),
            ],
          ),
          Expanded(
            flex: 2,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ReusableCard(
                  newColor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          const Text(
                            'CM',
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: const Color(0xFF8d8E98),
                          thumbColor: const Color(0xFFEB1555),
                          overlayColor: const Color(0x1fEB1555),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 30.0),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: ReusableCard(
                  newColor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                  const Color(0xFF4C4F5E)),
                              elevation: WidgetStateProperty.all(20.0),
                            ),
                            child: const Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                  const Color(0xFF4C4F5E)),
                              elevation: WidgetStateProperty.all(20.0),
                            ),
                            child: const Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ReusableCard(
                  newColor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                  const Color(0xFF4C4F5E)),
                              elevation: WidgetStateProperty.all(20.0),
                            ),
                            child: const Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                  const Color(0xFF4C4F5E)),
                              elevation: WidgetStateProperty.all(20.0),
                            ),
                            child: const Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getResult(),
                          interpretation: calc.getInterpretation(),
                        )),
              );
            },
            child: Container(
              color: kBottomColor,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              padding: const EdgeInsets.only(bottom: 20.0),
              child: const Center(
                child: Text(
                  'CALCULATE',
                  style: kLageButtonTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
