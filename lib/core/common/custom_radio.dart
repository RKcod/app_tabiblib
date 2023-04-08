import 'package:flutter/material.dart';
import 'package:tabiblib/core/enums/enums.dart';
import 'package:tabiblib/core/utils/palette.dart';

class CustomRadio extends StatelessWidget {
  final String text;
  final Gender value;
  final Gender groupValue;
  final void Function(Gender?) onChanged;
  const CustomRadio(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
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
              Text(text)
            ],
          ),
        ),
      ),
    );
  }
}
