import 'package:flutter/material.dart';
import 'constants.dart';

class ButtomButtom extends StatelessWidget {
  const ButtomButtom(
      {super.key, required this.onTap, required this.buttomTitle});
  final Function() onTap;
  final String buttomTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: const Color(0xFFEB1555),
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: 80,
        child: Center(
            child: Text(
          buttomTitle,
          style: kLargeButtonTextStyle,
        )),
      ),
    );
  }
}
