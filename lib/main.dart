import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabiblib/core/common/custom_bottom_nav.dart';
import 'package:tabiblib/core/providers/providers.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/l10n/l10n.dart';
import 'package:tabiblib/models/hive/user/user.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final isar = await Isar.open([UserSchema]);

  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      isarProvider.overrideWithValue(isar)
    ],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final ThemeData theme = ThemeData();
  final ThemeData darkTheme = ThemeData.dark();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "tabiblib",
      debugShowCheckedModeBanner: false,
      locale: ref.watch(localeProvider),
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        Future.delayed(const Duration(milliseconds: 20), () {
          if (ref.read(localeProvider) == null) {
            var locale =
                ref.read(sharedPreferencesProvider).getString("locale");

            if (locale != null) {
              ref.read(localeProvider.notifier).state = Locale(locale);
            } else {
              ref.read(localeProvider.notifier).state =
                  deviceLocale?.languageCode == "ar"
                      ? const Locale("ar")
                      : const Locale("fr");
            }
          }
        });

        return null;
      },
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: child!,
        );
      },
      theme: theme.copyWith(
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Palette.primaryColor,
            selectionHandleColor: Palette.primaryColor,
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 247, 245, 245),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white, foregroundColor: Colors.black)),
      home: const CustomBottomNav(),
    );
  }
}
