import 'package:flutter/material.dart';
import 'package:tabiblib/core/utils/palette.dart';

class RowPraticien extends StatelessWidget {
  const RowPraticien({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundColor: Palette.primaryColor,
          backgroundImage: AssetImage("assets/images/doctor.png"),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Dr Carmen DARADICI",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Chirurgien-dentiste",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
          ),
        ),
        const Icon(Icons.keyboard_arrow_right)
      ],
    );
  }
}
