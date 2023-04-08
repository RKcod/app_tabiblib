import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String? text;
  final IconData icon;
  final void Function() onPressed;
  const CustomIconButton(
      {super.key, this.text, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Color colorTheme = Theme.of(context).brightness == Brightness.light
        ? Colors.white
        : Colors.black;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 48,
          width: 48,
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                backgroundColor: colorTheme),
            child: Icon(
              icon,
              color: colorTheme == Colors.white ? Colors.black : Colors.white,
            ),
          ),
        ),
        Visibility(
          visible: text != null,
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              text ?? "",
              style: const TextStyle(fontSize: 11),
            ),
          ),
        )
      ],
    );
  }
}
