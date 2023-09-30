// ignore_for_file: library_private_types_in_public_api

import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/utils/string_utils.dart';
import 'package:dating_app/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class ChooseInterestsWidget extends StatefulWidget {
  const ChooseInterestsWidget({super.key});

  @override
  _ChooseInterestsWidgetState createState() => _ChooseInterestsWidgetState();
}

class _ChooseInterestsWidgetState extends State<ChooseInterestsWidget> {
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
            const SizedBox(
              height: SizeConstants.mediumPadding,
            ),
            Text(
              StringConstants.interests,
              style: ThemeConfiguration.registerHeadingTextStyle(),
            ),
            const SizedBox(
              height: SizeConstants.bigPadding,
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
                        horizontal: SizeConstants.mainPagePadding,
                        vertical: SizeConstants.smallPadding,
                      ),
                      decoration: BoxDecoration(
                          color: selected[index]
                              ? ThemeConfiguration.primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(35.0),
                          border: Border.all(
                            color: !selected[index]
                                ? ThemeConfiguration.primaryColor
                                : ThemeConfiguration.scaffoldBgColor,
                          )),
                      child: Text(
                        option,
                        style: TextStyle(
                          color: selected[index]
                              ? ThemeConfiguration.scaffoldBgColor
                              : ThemeConfiguration.primaryColor,
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
