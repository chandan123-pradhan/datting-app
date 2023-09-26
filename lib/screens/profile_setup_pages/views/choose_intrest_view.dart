// ignore_for_file: library_private_types_in_public_api

import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/string_utils.dart';
import 'package:dating_app/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class ChooseIntrestView extends StatefulWidget {
  const ChooseIntrestView({super.key});

  @override
  _ChooseIntrestViewState createState() => _ChooseIntrestViewState();
}

class _ChooseIntrestViewState extends State<ChooseIntrestView> {
  List<String> options = [
    '💃 Dancing',
    '🎮 Gaming',
    '🎬 Movie',
    '🎵 Music',
    '🍀 Nature',
    '📸 Photography',
    '📚 Reading',
    '🏛️ Architecture',
    "✍🏻 Writing",
    "👗 Fashion",
    "🗣️ Language",
    "💪🏻 Gym & Fitness",
    "🐶 Animals"
  ];
  List<bool> selected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextWidgets.h2Tag(text: StringUtils.interests),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: options.asMap().entries.map((entry) {
                  int index = entry.key;
                  String option = entry.value;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selected[index] = !selected[index];
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      decoration: BoxDecoration(
                          color: selected[index]
                              ? ColorConstant.descriptiveColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(35.0),
                          border: Border.all(
                            color: !selected[index]
                                ? ColorConstant.primaryColor
                                : Colors.white,
                          )),
                      child: Text(
                        option,
                        style: TextStyle(
                          color: selected[index]
                              ? ColorConstant.whiteColor
                              : ColorConstant.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
