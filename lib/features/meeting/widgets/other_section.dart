import 'package:flutter/material.dart';
import 'package:tabiblib/core/utils/palette.dart';

class OtherSection extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function() onPressed;
  const OtherSection(
      {super.key,
      required this.icon,
      required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onPressed,
            child: const Text(
              "Voir plus",
              style: TextStyle(
                  fontSize: 14,
                  color: Palette.primaryColor,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
