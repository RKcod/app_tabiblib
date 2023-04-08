import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String? title;
  final List<String> options;
  final String hint;
  final void Function(String?)? onChanged;
  final String? value;
  const CustomDropdown(
      {super.key,
      required this.options,
      this.title,
      required this.hint,
      this.onChanged,
      this.value});

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
              border: Border.all(color: Colors.black26)),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                items: options
                    .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(
                            e,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ))
                    .toList(),
                value: value,
                isExpanded: true,
                focusColor: Colors.white,
                hint: Text(hint),
                onChanged: onChanged,
                icon: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
