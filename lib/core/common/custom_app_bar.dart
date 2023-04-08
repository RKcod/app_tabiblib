import 'package:flutter/material.dart';
import 'package:tabiblib/core/utils/palette.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TabBar? bottom;
  final double height;
  final bool isLeading;
  final Widget? titleWidget;
  final void Function()? onPressedLeading;
  final Widget? trailing;
  const CustomAppBar(
      {super.key,
      this.title = "",
      this.bottom,
      this.height = 56,
      this.isLeading = false,
      this.onPressedLeading,
      this.titleWidget,
      this.trailing});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ??
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
      centerTitle: isLeading,
      leading: isLeading
          ? IconButton(
              splashRadius: 16,
              onPressed: onPressedLeading ??
                  () {
                    Navigator.pop(context);
                  },
              icon: const Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white,
                size: 32,
              ))
          : null,
      backgroundColor: Palette.primaryColor,
      bottom: bottom,
      actions: trailing == null ? null : [trailing!],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
