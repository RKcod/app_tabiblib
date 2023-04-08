import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as riverpod;
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabiblib/services/api_provider.dart';

final dioProvider = riverpod.Provider((_) => Dio());
final apiProvider =
    riverpod.Provider((ref) => ApiProvider(ref.watch(dioProvider)));
final sharedPreferencesProvider = riverpod.Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final isarProvider = riverpod.Provider<Isar>((ref) {
  throw UnimplementedError();
});

final localeProvider = riverpod.StateProvider<Locale?>(
  (ref) => null,
);
