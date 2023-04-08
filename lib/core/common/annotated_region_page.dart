import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnnotatedRegionPage extends StatelessWidget {
  const AnnotatedRegionPage({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: Theme.of(context).brightness == Brightness.dark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: child,
    );
  }
}
