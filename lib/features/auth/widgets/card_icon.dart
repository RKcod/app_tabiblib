import 'package:flutter/material.dart';
import 'package:tabiblib/core/utils/palette.dart';

class CardIcon extends StatelessWidget {
  final IconData icon;
  const CardIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Palette.primaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8)),
      child: Icon(
        icon,
        color: Palette.primaryColor,
      ),
    );
  }
}
