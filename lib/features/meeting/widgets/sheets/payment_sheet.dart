import 'package:flutter/material.dart';

class PaymentSheet extends StatelessWidget {
  const PaymentSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Actes et soins les plus fréquents chez ce praticien",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                      Text("Enfant - Consultation"),
                      Text(
                        "23 \$",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
              itemCount: 2),
          const Divider(
            color: Colors.black26,
            height: 64,
          ),
          Row(
            children: const [
              Icon(
                Icons.euro,
                size: 16,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "Secteur de conventionnement",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              "Minim ullamco et esse aliqua aliqua aliquip do sint cupida"
              "tat exercitation incididunt do enim deserunt. Consectetur ut irure culpa et"
              " veniam veniam. Labore Lorem aute voluptate reprehenderit. Cupidatat est consect",
              style: TextStyle(height: 1.8),
            ),
          ),
          const SizedBox(
            height: 48,
          ),
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
                "Carte vitale",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              "Minim ullamco et esse aliqua aliqua aliquip do sint cupida"
              "tat exercitation incididunt do enim deserunt. Consectetur ut irure culpa et"
              " veniam veniam. Labore Lorem aute voluptate reprehenderit. Cupidatat est consect",
              style: TextStyle(height: 1.8),
            ),
          ),
          const Divider(
            height: 64,
            color: Colors.black26,
          ),
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
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
    );
  }
}
