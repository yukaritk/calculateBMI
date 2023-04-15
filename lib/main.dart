import 'package:calculator/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0XFF0A0E21),
        scaffoldBackgroundColor: const Color(0XFF0A0E21),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: (Colors.white),
            ),
        appBarTheme: const AppBarTheme(color: Color(0XFF0A0E21)),
      ),
      home: const InputPage(),
    );
  }
}
