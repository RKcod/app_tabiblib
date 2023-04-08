import 'package:flutter/material.dart';
import 'package:tabiblib/core/utils/palette.dart';

class Accordion extends StatefulWidget {
  final String title;
  final List<String> textsCard;
  final void Function() onPressedCard;
  const Accordion(
      {super.key,
      required this.title,
      required this.textsCard,
      required this.onPressedCard});

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Palette.primaryColor)),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                expanded = !expanded;
                setState(() {});
              },
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    AnimatedRotation(
                      turns: expanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Palette.primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut,
              constraints: BoxConstraints(maxHeight: expanded ? 700 : 0),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Divider(
                      color: Colors.black26,
                      thickness: 1,
                      height: 0,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: GridView.custom(
                        shrinkWrap: true,
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 8,
                                mainAxisExtent: 48,
                                crossAxisSpacing: 8),
                        childrenDelegate: SliverChildBuilderDelegate(
                            (context, index) => GestureDetector(
                                  onTap: widget.onPressedCard,
                                  child: Container(
                                    color:
                                        Palette.primaryColor.withOpacity(0.2),
                                    alignment: Alignment.center,
                                    child: Text(
                                      widget.textsCard[index],
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                            childCount: widget.textsCard.length),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
