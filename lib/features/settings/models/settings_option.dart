import 'package:flutter/material.dart';

class SettingsOption {
  final IconData? icon;
  final String? title;
  final String subtitle;
  final void Function() onPressed;
  SettingsOption({
    this.icon,
    this.title,
    required this.subtitle,
    required this.onPressed,
  });
}
