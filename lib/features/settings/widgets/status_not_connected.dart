import 'package:flutter/material.dart';
import 'package:tabiblib/features/settings/models/settings.dart';
import 'package:tabiblib/features/settings/models/settings_option.dart';
import 'package:tabiblib/features/settings/widgets/settings_tile.dart';
import 'package:tabiblib/features/settings/widgets/sign_in.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StatusNotConnected extends StatelessWidget {
  const StatusNotConnected({super.key});

  @override
  Widget build(BuildContext context) {
    var settingsOptions = Settings(
        title: AppLocalizations.of(context)!.confidentiality,
        options: [
          SettingsOption(
              subtitle: AppLocalizations.of(context)!.myPreferences,
              onPressed: () {}),
          SettingsOption(
              subtitle: AppLocalizations.of(context)!.legalInformations,
              onPressed: () {})
        ]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SignIn(),
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            settingsOptions.title,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, secondIndex) => SettingsTile(
                  icon: settingsOptions.options[secondIndex].icon,
                  title: settingsOptions.options[secondIndex].title,
                  subtitle: settingsOptions.options[secondIndex].subtitle,
                  onPressed: settingsOptions.options[secondIndex].onPressed,
                  isBorderBottom:
                      secondIndex == settingsOptions.options.length - 1,
                ),
            itemCount: settingsOptions.options.length),
        const SizedBox(
          height: 32,
        ),
        const Center(
          child: Text(
            "v1.0.0",
          ),
        ),
      ],
    );
  }
}
