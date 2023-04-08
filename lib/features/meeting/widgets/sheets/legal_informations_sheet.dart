import 'package:flutter/material.dart';

class LegalInformationsSheet extends StatelessWidget {
  const LegalInformationsSheet({super.key});

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
                    width: 104,
                    child: Text(
                      "Numéro RPPS:",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "18734436543664378476",
                      style: TextStyle(fontSize: 13),
                    ),
                  )
                ],
              ),
          separatorBuilder: (context, index) => const SizedBox(
                height: 16,
              ),
          itemCount: 2),
    );
  }
}
