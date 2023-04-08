import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/extensions/string_extension.dart';
import 'package:tabiblib/core/providers/providers.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/models/user_model.dart';

class SelectRadioUser extends ConsumerWidget {
  final UserModel value;
  final UserModel groupValue;
  final void Function(UserModel?) onChanged;
  const SelectRadioUser(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sharedPreferences = ref.watch(sharedPreferencesProvider);
    var userData = UserModel.fromJson(sharedPreferences.getString("user")!);

    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: value == groupValue
                    ? Palette.primaryColor
                    : Colors.black26)),
        child: Row(
          children: [
            Radio(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
                fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return Palette.primaryColor;
                    }

                    return Colors.black26;
                  },
                )),
            CircleAvatar(
              backgroundColor: value.firstName[0].colorAvatar(),
              radius: 16,
              child: Center(
                child: Text(
                  value.firstName[0].toUpperCase() +
                      value.name[0].toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              "${value.firstName.capitalize()} ${value.name.toUpperCase()}",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Visibility(
                visible: value == userData,
                child: const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text("moi"),
                ))
          ],
        ),
      ),
    );
  }
}
