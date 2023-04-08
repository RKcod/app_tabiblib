import 'package:flutter/material.dart';
import 'package:tabiblib/core/utils/palette.dart';

class ImportantInformationsMeeting extends StatelessWidget {
  const ImportantInformationsMeeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.black,
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 24),
                child: Icon(
                  Icons.person,
                  size: 18,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Patient",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Mohamed",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  )
                ],
              )
            ],
          ),
          const Divider(
            color: Colors.black26,
            height: 48,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 24),
                child: Icon(
                  Icons.call_outlined,
                  size: 18,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Téléphone du lieu de consultation",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "876736763",
                    style: TextStyle(fontSize: 15, color: Palette.primaryColor),
                  )
                ],
              )
            ],
          ),
          const Divider(
            color: Colors.black26,
            height: 48,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 24),
                child: Icon(
                  Icons.location_on,
                  size: 18,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Se rendre à la consultation",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "Dentylis - Aubervilliers",
                      style: TextStyle(
                          fontSize: 15,
                          color: Palette.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "23 Rue Madeleine Vionnet",
                        style: TextStyle(
                            fontSize: 15, color: Palette.primaryColor),
                      ),
                    ),
                    Text(
                      "93300 Aubervilliers",
                      style:
                          TextStyle(fontSize: 15, color: Palette.primaryColor),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Rez-de-chaussée \nAccès handicapé \nDans le centre commercial à l'entrée principale (Porte 1) puis"
                      " première porte sur la gauche",
                      style: TextStyle(fontSize: 15, height: 1.5),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
