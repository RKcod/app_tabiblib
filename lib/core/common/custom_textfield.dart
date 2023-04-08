import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tabiblib/core/utils/palette.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialText;
  final String? title;
  final String hintText;
  final bool obscure;
  final bool seeEye;
  final bool isError;
  final bool isValid;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final void Function()? onSuffixTap;
  final bool coloredBorderError;
  final void Function(String)? onChanged;
  final int maxLines;
  const CustomTextfield(
      {super.key,
      required this.hintText,
      this.obscure = false,
      this.seeEye = false,
      this.controller,
      required this.isError,
      required this.isValid,
      this.inputFormatters,
      this.onSuffixTap,
      this.keyboardType,
      this.title,
      this.coloredBorderError = true,
      this.onChanged,
      this.maxLines = 1,
      this.initialText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
            visible: title != null,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                title ?? "",
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            )),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: isError && coloredBorderError
                      ? Colors.red
                      : Colors.black26)),
          child: TextFormField(
            controller: controller,
            initialValue: initialText,
            onChanged: onChanged,
            obscureText: obscure,
            obscuringCharacter: "*",
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            cursorColor: Palette.primaryColor,
            minLines: maxLines,
            maxLines: maxLines,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                suffixIconConstraints: const BoxConstraints(maxHeight: 36),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    isError
                        ? const Icon(
                            Icons.error_outline,
                            color: Colors.red,
                          )
                        : isValid
                            ? const Icon(
                                Icons.check_circle,
                                color: Palette.primaryColor,
                              )
                            : const SizedBox(),
                    Visibility(
                        visible: seeEye,
                        child: GestureDetector(
                          onTap: onSuffixTap,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Icon(
                              !obscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black54,
                            ),
                          ),
                        ))
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
