import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/common/custom_app_bar.dart';
import 'package:tabiblib/core/common/custom_bottom_nav.dart';
import 'package:tabiblib/core/extensions/string_extension.dart';
import 'package:tabiblib/core/providers/providers.dart';
import 'package:tabiblib/core/utils/utils.dart';
import 'package:tabiblib/features/settings/models/settings.dart';
import 'package:tabiblib/features/settings/models/settings_option.dart';
import 'package:tabiblib/features/settings/views/list_relatives.dart';
import 'package:tabiblib/features/settings/views/profile_view.dart';
import 'package:tabiblib/features/settings/widgets/double_authentification.dart';
import 'package:tabiblib/features/settings/widgets/edit_email.dart';
import 'package:tabiblib/features/settings/widgets/edit_password.dart';
import 'package:tabiblib/features/settings/widgets/edit_phone.dart';
import 'package:tabiblib/features/settings/widgets/encrypted_document.dart';
import 'package:tabiblib/features/settings/widgets/safety.dart';
import 'package:tabiblib/features/settings/widgets/settings_tile.dart';
import 'package:tabiblib/features/settings/widgets/status_not_connected.dart';
import 'package:tabiblib/models/user_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  List<Settings> settingsOptions = [];

  void initData() {
    var data = ref.read(sharedPreferencesProvider).getString("user");
    if (data != null) {
      var user = UserModel.fromJson(data);

      settingsOptions = [
        Settings(title: "Identité", options: [
          SettingsOption(
              icon: Icons.person_sharp,
              title: "Mon profil",
              subtitle:
                  "${user.firstName.capitalize()} ${user.name.toUpperCase()}",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const ProfileView()));
              }),
          SettingsOption(
              icon: Icons.group,
              title: "Mes proches",
              subtitle: "Ajouter et gérer les profils de vos proches",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const ListRelatives()));
              })
        ]),
        Settings(title: "Connexion", options: [
          SettingsOption(
              icon: Icons.phone,
              title: "Téléphone",
              subtitle: user.phone,
              onPressed: () {
                showCustomBottomSheet(context,
                    title: "Modifier le téléphone",
                    body: EditPhone(
                      initialPhone: user.phone,
                    ));
              }),
          SettingsOption(
              icon: Icons.email,
              title: "Email",
              subtitle: user.email,
              onPressed: () {
                showCustomBottomSheet(context,
                    title: "Modifier l'email",
                    body: EditEmail(
                      initialEmail: user.email,
                    ));
              }),
          SettingsOption(
              icon: Icons.lock,
              title: "Mot de passe",
              subtitle: user.password.passwordFormat(),
              onPressed: () {
                showCustomBottomSheet(context,
                    title: "Modifier votre mot de passe",
                    body: const EditPassword());
              })
        ]),
        Settings(title: "Sécurité", options: [
          SettingsOption(
              icon: Icons.key,
              title: "Double authentification",
              subtitle:
                  "Protection supplémentaire lorsque vous vous connectez à votre compte",
              onPressed: () {
                showCustomBottomSheet(context,
                    title: "Double Authentification",
                    body: const DoubleAuthentification());
              }),
          SettingsOption(
              icon: Icons.verified_user,
              title: "Documents chiffrés de bout en bout",
              subtitle:
                  "Tous vos documents protégés avec le plus haut standard de sécurité",
              onPressed: () {
                showCustomBottomSheet(context,
                    title: "Documents chiffrés de bout en bout",
                    body: const EncryptedDocument());
              }),
        ]),
        Settings(
            title: AppLocalizations.of(context)!.confidentiality,
            options: [
              SettingsOption(
                  subtitle: AppLocalizations.of(context)!.myPreferences,
                  onPressed: () {}),
              SettingsOption(
                  subtitle: AppLocalizations.of(context)!.legalInformations,
                  onPressed: () {}),
              SettingsOption(subtitle: "Supprimer mon compte", onPressed: () {})
            ]),
      ];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var sharedPreferences = ref.watch(sharedPreferencesProvider);
    initData();

    return Scaffold(
      appBar: CustomAppBar(
          title: sharedPreferences.getString("user") != null
              ? AppLocalizations.of(context)!.account
              : AppLocalizations.of(context)!.connection),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: sharedPreferences.getString("user") != null
            ? Column(
                children: [
                  const Safety(),
                  const SizedBox(
                    height: 64,
                  ),
                  ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  settingsOptions[index].title,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black54),
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, secondIndex) =>
                                      SettingsTile(
                                        icon: settingsOptions[index]
                                            .options[secondIndex]
                                            .icon,
                                        title: settingsOptions[index]
                                            .options[secondIndex]
                                            .title,
                                        subtitle: settingsOptions[index]
                                            .options[secondIndex]
                                            .subtitle,
                                        onPressed: settingsOptions[index]
                                            .options[secondIndex]
                                            .onPressed,
                                        isBorderBottom: secondIndex ==
                                            settingsOptions[index]
                                                    .options
                                                    .length -
                                                1,
                                      ),
                                  itemCount:
                                      settingsOptions[index].options.length)
                            ],
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 40,
                          ),
                      itemCount: settingsOptions.length),
                  const SizedBox(
                    height: 48,
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.read(sharedPreferencesProvider).clear();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CustomBottomNav()),
                          (route) => false);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.black12),
                              bottom: BorderSide(color: Colors.black12))),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.exit_to_app,
                            color: Colors.redAccent,
                            size: 16,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Déconnexion",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.redAccent),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_right,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    "v1.0.0",
                  ),
                  const SizedBox(
                    height: 8,
                  )
                ],
              )
            : const StatusNotConnected(),
      ),
    );
  }
}
