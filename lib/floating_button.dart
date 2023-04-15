import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton(
      {super.key, required this.iconCalculator, required this.calc});
  final IconData iconCalculator;
  final Function() calc;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: calc,
      elevation: 6,
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(iconCalculator),
    );
  }
}
