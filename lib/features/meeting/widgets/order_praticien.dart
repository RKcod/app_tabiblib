import 'package:flutter/material.dart';
import 'package:tabiblib/core/common/custom_tile.dart';

class OrderPraticien extends StatelessWidget {
  const OrderPraticien({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.black,
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "A faire avant la consultation",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                        "Gagnez du temps lors de la consultation en complétant les étapes suivantes"),
                  ],
                )),
                const SizedBox(
                  width: 16,
                ),
                Image.asset(
                  "assets/images/doctor.png",
                  width: 60,
                  height: 60,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const CustomTile(
              icon: Icons.check_circle, text: "Voir les consignes ou documents")
        ],
      ),
    );
  }
}
