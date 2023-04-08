import 'package:flutter/material.dart';

class ExperienceSheet extends StatelessWidget {
  const ExperienceSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => Row(
                children: const [
                  SizedBox(
                    width: 96,
                    child: Text(
                      "2014",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Cabinet - Orly",
                      style: TextStyle(fontSize: 13),
                    ),
                  )
                ],
              ),
          separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
          itemCount: 2),
    );
  }
}
