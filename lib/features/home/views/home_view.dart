import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/common/custom_button.dart';
import 'package:tabiblib/core/providers/providers.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/auth/views/identification_view.dart';
import 'package:tabiblib/features/home/widgets/are_praticien.dart';
import 'package:tabiblib/features/home/widgets/header.dart';
import 'package:tabiblib/features/home/widgets/home_connected.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sharedPreferences = ref.watch(sharedPreferencesProvider);

    return Scaffold(
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(statusBarColor: Palette.primaryColor),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const Header(),
              sharedPreferences.getString("user") != null
                  ? const HomeConnected()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 32),
                            child: Text(
                              AppLocalizations.of(context)!.atServiceEveryone,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          Image.asset(
                            "assets/images/home_image.png",
                            height: 200,
                          ),
                          const ArePraticien()
                        ],
                      ),
                    )
            ],
          ),
        )),
      ),
    );
  }
}
