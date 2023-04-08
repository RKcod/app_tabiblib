import 'package:flutter/material.dart';

class LanguagesSheet extends StatelessWidget {
  const LanguagesSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(right: 32, top: 16),
                child: Text(
                  "Anglais",
                  style: TextStyle(),
                ),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
          itemCount: 2),
    );
  }
}
