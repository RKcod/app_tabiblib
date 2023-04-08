import 'package:flutter/material.dart';
import 'package:tabiblib/core/utils/palette.dart';

class SettingsTile extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final String subtitle;
  final void Function() onPressed;
  final bool isBorderBottom;
  const SettingsTile(
      {super.key,
      this.isBorderBottom = false,
      this.icon,
      this.title,
      required this.subtitle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border(
                top: const BorderSide(color: Colors.black12),
                bottom: isBorderBottom
                    ? const BorderSide(color: Colors.black12)
                    : BorderSide.none)),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Visibility(
                visible: icon != null,
                child: Container(
                  height: double.infinity,
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(right: 16),
                  child: Icon(
                    icon,
                    color: Palette.primaryColor,
                    size: 16,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: title != null,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            title ?? "",
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_right,
              )
            ],
          ),
        ),
      ),
    );
  }
}
