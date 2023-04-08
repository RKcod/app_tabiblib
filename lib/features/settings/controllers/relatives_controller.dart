import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:tabiblib/core/providers/providers.dart';
import 'package:tabiblib/models/hive/user/user.dart';
import 'package:tabiblib/models/user_model.dart';

final relativesControllerProvider = ChangeNotifierProvider((ref) {
  return RelativesController(ref);
});

class RelativesController extends ChangeNotifier {
  List<UserModel> relatives = [];

  final Ref ref;
  RelativesController(
    this.ref,
  ) {
    initializeData();
  }

  void initializeData() async {
    var isar = ref.read(isarProvider);

    relatives = (await isar.users.where().findAll())
        .map((e) => UserModel.fromIsar(e))
        .toList();
    notifyListeners();
  }

  void addRelative(UserModel userData) async {
    final user = User()
      ..name = userData.name
      ..firstName = userData.firstName
      ..email = userData.email
      ..password = userData.password
      ..gender = userData.gender
      ..phone = userData.phone
      ..birthDay = userData.birthDay;

    var isar = ref.read(isarProvider);

    isar.writeTxn(() async {
      await isar.users.put(user);
      initializeData();
    });
  }

  void editRelative(UserModel userData) async {
    var isar = ref.read(isarProvider);

    isar.writeTxn(() async {
      var user = await isar.users.get(userData.id!);
      user!.name = userData.firstName;
      user.firstName = userData.firstName;

      await isar.users.put(user);

      initializeData();
    });
  }

  void removeRelative(int index) async {
    var isar = ref.read(isarProvider);

    isar.writeTxn(() async {
      await isar.users.delete(index);

      initializeData();
    });
  }
}
