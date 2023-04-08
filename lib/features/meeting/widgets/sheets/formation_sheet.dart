import 'package:flutter/material.dart';

class FormationSheet extends StatelessWidget {
  const FormationSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Diplômes nationaux et universitaires",
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 32, top: 16),
                        child: Text(
                          "2014",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Ad veniam sint sunt cupidatat occaecat adipisicing nulla qui sit. Tempor minim do est ad "
                          "minim labore consectetur labore et magna laborum. Commodo consequat ut",
                          style: TextStyle(fontSize: 13, height: 1.8),
                        ),
                      )
                    ],
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
              itemCount: 2),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Autres formations",
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 32, top: 16),
                        child: Text(
                          "2014",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Ad veniam sint sunt cupidatat occaecat adipisicing nulla qui sit. Tempor minim do est ad "
                          "minim labore consectetur labore et magna laborum. Commodo consequat ut",
                          style: TextStyle(height: 1.8),
                        ),
                      )
                    ],
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
              itemCount: 2),
        ],
      ),
    );
  }
}
