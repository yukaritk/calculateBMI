import 'package:calculator/constants.dart';
import 'package:calculator/new_icon.dart';
import 'package:calculator/results_page.dart';
import 'package:calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'buttom_buttom.dart';
import 'calculate_brain.dart';
import 'floating_button.dart';

enum Gender {
  empty,
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

Gender selectGender = Gender.empty;

int height = 180;
int weight = 60;
int age = 20;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                      colour: selectGender == Gender.male
                          ? kActiveCardColor
                          : kInativeCardColor,
                      cardChild: const NewIcon(
                          icon: FontAwesomeIcons.mars, label: 'MALE'),
                      onTap: () {
                        setState(() {
                          selectGender = Gender.male;
                        });
                      })),
              Expanded(
                  child: ReusableCard(
                      colour: selectGender == Gender.female
                          ? kActiveCardColor
                          : kInativeCardColor,
                      cardChild: const NewIcon(
                          icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                      onTap: () {
                        setState(() {
                          selectGender = Gender.female;
                        });
                      })),
            ],
          )),
          Expanded(
              child: ReusableCard(
            colour: kInativeCardColor,
            onTap: () {},
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
                      style: kTextHeight,
                    ),
                    const Text('cm', style: kLabelTextStyle),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 30),
                    thumbColor: const Color(0xFFEB1555),
                    overlayColor: const Color(0x29EB1555),
                    inactiveTrackColor: const Color(0XFF8D8E98),
                    activeTrackColor: Colors.white,
                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                )
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                      colour: kInativeCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kTextHeight,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FloatingButton(
                                iconCalculator: FontAwesomeIcons.minus,
                                calc: () {
                                  setState(() {
                                    weight = weight - 1;
                                  });
                                },
                              ),
                              FloatingButton(
                                iconCalculator: FontAwesomeIcons.plus,
                                calc: () {
                                  setState(() {
                                    weight = weight + 1;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      onTap: () {})),
              Expanded(
                  child: ReusableCard(
                      colour: kInativeCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kTextHeight,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FloatingButton(
                                  iconCalculator: FontAwesomeIcons.minus,
                                  calc: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              FloatingButton(
                                  iconCalculator: FontAwesomeIcons.plus,
                                  calc: () {
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                      onTap: () {})),
            ],
          )),
          ButtomButtom(
            buttomTitle: 'CALCULATE',
            onTap: () {
              CalculateBrain calc =
                  CalculateBrain(weight: weight, height: height);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getRsult(),
                        interpretation: calc.getInterpretation()),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
