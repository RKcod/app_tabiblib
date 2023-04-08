import 'package:flutter/material.dart';
import 'package:tabiblib/core/utils/palette.dart';

class CustomTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onPressed;
  const CustomTile(
      {super.key, required this.icon, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          children: [
            Icon(
              icon,
              color: Palette.primaryColor,
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Palette.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }
}
