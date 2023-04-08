import 'package:flutter/material.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/core/utils/utils.dart';
import 'package:tabiblib/features/meeting/widgets/sheets/payment_sheet.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.black),
      padding: const EdgeInsets.symmetric(vertical: 24),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.euro,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Text(
                      "Tarifs et remboursements",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        showCustomBottomSheet(context,
                            title: "Tarifs et remboursements",
                            body: const PaymentSheet());
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
                  child: Text("Conventionné"),
                ),
                const Text("Carte vitale acceptée")
              ],
            ),
          ),
          const Divider(
            height: 32,
            color: Colors.black26,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.credit_card,
                      size: 16,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Moyens de paiement",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Spacer()
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text("Chèques, espèces et cartes bancaires"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
