import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:tabiblib/core/common/custom_header_sheet.dart';

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

void showCustomBottomSheet(BuildContext context,
    {required String title,
    Widget? body,
    Widget Function(BuildContext, ScrollController, SheetState)?
        customBuilder}) {
  showSlidingBottomSheet(context,
      builder: (builder) => SlidingSheetDialog(
          avoidStatusBar: true,
          duration: const Duration(milliseconds: 500),
          snapSpec: const SnapSpec(snappings: [0, 1]),
          cornerRadius: 8,
          cornerRadiusOnFullscreen: 0,
          headerBuilder: (context, state) => Material(
                color: Colors.transparent,
                child: CustomHeaderSheet(
                  title: title,
                ),
              ),
          builder: body == null
              ? null
              : (context, state) => Material(
                    color: Colors.transparent,
                    child: body,
                  ),
          customBuilder: customBuilder));
}
