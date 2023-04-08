import 'package:flutter/material.dart';

class AddressSheet extends StatelessWidget {
  const AddressSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("22 Avenue nationale"),
          const SizedBox(
            height: 12,
          ),
          const Text("Massy"),
          const SizedBox(
            height: 32,
          ),
          Row(
            children: const [
              Icon(
                Icons.directions_bus_outlined,
                size: 16,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "Modes de transport",
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
              itemBuilder: (context, index) => const Text("Bus - Jean Mermoz"),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
              itemCount: 2),
          const SizedBox(
            height: 32,
          ),
          Row(
            children: const [
              Icon(
                Icons.apartment_outlined,
                size: 16,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "Informations pratiques",
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
              itemBuilder: (context, index) => const Text("Bus - Jean Mermoz"),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
              itemCount: 2)
        ],
      ),
    );
  }
}
