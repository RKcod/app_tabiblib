import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tabiblib/core/common/custom_button.dart';
import 'package:tabiblib/core/common/custom_dropdown.dart';
import 'package:tabiblib/core/common/custom_textfield.dart';
import 'package:tabiblib/core/extensions/string_extension.dart';
import 'package:tabiblib/core/providers/providers.dart';
import 'package:tabiblib/core/utils/palette.dart';
import 'package:tabiblib/features/documents/controllers/document_controller.dart';
import 'package:tabiblib/models/user_model.dart';

class AddDocumentTwo extends ConsumerWidget {
  const AddDocumentTwo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var documentController = ref.watch(documentControllerProvider);
    var sharedPreferences = ref.watch(sharedPreferencesProvider);
    var userData = UserModel.fromJson(sharedPreferences.getString("user")!);
    var typesDocument = [
      "Courrier d'adressage",
      "Compte rendu",
      "Résultats d'analyse",
      "Imagerie médicale",
      "Ordonnance de médicaments",
      "Ordonnance de biologie",
      "Ordonnance d'imagerie",
      "Ordonnance de soins paramédicaux",
      "Autre"
    ];

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextfield(
              controller: documentController.nameDocumentController,
              title: "Nom du document",
              hintText: "Nom du document",
              isError: false,
              isValid: false),
          const SizedBox(
            height: 24,
          ),
          CustomDropdown(
            title: "Sélectionner le type de document",
            options: typesDocument,
            hint: "Sélectionner le type de document",
            value: documentController.typeDocument,
            onChanged: (value) => documentController.changeTypeDocument(value!),
          ),
          const SizedBox(
            height: 32,
          ),
          const Text(
            "Patient concerné",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Icon(Icons.person),
              const SizedBox(
                width: 8,
              ),
              Text(
                  "${userData.firstName.capitalize()} ${userData.name.toUpperCase()}")
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.lock,
                color: Palette.primaryColor,
              ),
              SizedBox(
                width: 8,
              ),
              Text("Ce document sera chiffré")
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          CustomButton(
            text: "AJOUTER UN DOCUMENT",
            isFullWidth: true,
            onPressed: () {},
            isDisabled:
                documentController.nameDocumentController.text.isEmpty &&
                    documentController.typeDocument == null,
          )
        ],
      ),
    );
  }
}
