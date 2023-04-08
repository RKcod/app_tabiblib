import 'package:flutter/material.dart';
import 'package:tabiblib/core/utils/palette.dart';

class HourlySheet extends StatelessWidget {
  const HourlySheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.schedule,
                size: 16,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "Horaires d'ouverture",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Lundi:"),
                      Text(
                        "Fermé",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
              itemCount: 7),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: const [
              Icon(
                Icons.call_outlined,
                size: 16,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "Coordonnées",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            child: const Text(
              "73 55 25 26",
              style: TextStyle(
                  color: Palette.primaryColor,
                  decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }
}
