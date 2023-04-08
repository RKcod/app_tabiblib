import 'package:flutter/material.dart';
import 'package:tabiblib/core/common/custom_button.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArePraticien extends StatelessWidget {
  const ArePraticien({super.key});

  @override
  Widget build(BuildContext context) {
    List writing = [
      [Icons.schedule, AppLocalizations.of(context)!.getSoftwareText1],
      [
        Icons.visibility_outlined,
        AppLocalizations.of(context)!.getSoftwareText2
      ],
      [Icons.handshake, AppLocalizations.of(context)!.getSoftwareText3],
      [Icons.home, AppLocalizations.of(context)!.getSoftwareText4]
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: Palette.primaryColor.withOpacity(0.25),
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                const Icon(
                  Icons.safety_check,
                  color: Palette.primaryColor,
                  size: 64,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    AppLocalizations.of(context)!.yourHealth,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.confidentialityDescription,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black38),
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomButton(
                  onPressed: () {},
                  text: AppLocalizations.of(context)!.discoverEngagement,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          Text(AppLocalizations.of(context)!.youArePraticien,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 16,
          ),
          Text(AppLocalizations.of(context)!.getSoftware,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38)),
          const SizedBox(
            height: 12,
          ),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16, top: 12),
                      child: Icon(
                        writing[index][0],
                        size: 18,
                      ),
                    ),
                    Expanded(
                        child: Text(
                      writing[index][1],
                      style: const TextStyle(fontSize: 13, height: 1.8),
                    ))
                  ]),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
              itemCount: writing.length)
        ],
      ),
    );
  }
}
