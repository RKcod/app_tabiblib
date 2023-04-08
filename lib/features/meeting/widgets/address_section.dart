import 'package:flutter/material.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/core/utils/utils.dart';
import 'package:tabiblib/features/meeting/widgets/sheets/address_sheet.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.black),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 16,
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                "Adresses",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  showCustomBottomSheet(context,
                      title: "Adresses", body: const AddressSheet());
                },
                child: const Text(
                  "Voir plus",
                  style: TextStyle(
                      fontSize: 14,
                      color: Palette.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text("22 Avenue nationale"),
          ),
          const Text("Massy")
        ],
      ),
    );
  }
}
