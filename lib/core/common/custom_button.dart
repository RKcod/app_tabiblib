import 'package:flutter/material.dart';

import 'package:tabiblib/core/utils/palette.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final bool isFullWidth;
  final Color color;
  final bool isDisabled;
  final bool transparent;
  const CustomButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.isFullWidth = false,
    this.color = Palette.primaryColor,
    this.isDisabled = false,
    this.transparent = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: isFullWidth ? double.infinity : null,
      child: TextButton(
          onPressed: isDisabled ? null : onPressed,
          style: TextButton.styleFrom(
              backgroundColor:
                  transparent ? null : color.withOpacity(isDisabled ? 0.5 : 1),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: transparent
                    ? (Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white)
                    : Colors.white,
                fontWeight: FontWeight.w500),
          )),
    );
  }
}
