import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  const Stats({super.key});

  @override
  Widget build(BuildContext context) {
    var datas = [
      ["70 millions", "de patients"],
      ["340 000", "personnels de santé"],
      ["97%", "d'avis positifs'"]
    ];

    return Column(
      children: [
        const Text(
          "Tabiblib c'est ...",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        const SizedBox(
          height: 40,
        ),
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      datas[index][0],
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          datas[index][1],
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black38),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Icon(
                          Icons.help_outline,
                          color: Colors.black38,
                          size: 16,
                        )
                      ],
                    )
                  ],
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 32,
                ),
            itemCount: 3)
      ],
    );
  }
}
