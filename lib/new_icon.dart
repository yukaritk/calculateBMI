import 'package:flutter/material.dart';

import 'constants.dart';

class NewIcon extends StatelessWidget {
  const NewIcon({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        icon,
        size: 80,
      ),
      const SizedBox(
        height: 15,
      ),
      Text(
        label,
        style: kLabelTextStyle,
      ),
    ]);
  }
}
