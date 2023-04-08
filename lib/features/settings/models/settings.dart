import 'package:tabiblib/features/settings/models/settings_option.dart';

class Settings {
  final String title;
  final List<SettingsOption> options;
  Settings({
    required this.title,
    required this.options,
  });
}
