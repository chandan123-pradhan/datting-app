// ignore_for_file: library_private_types_in_public_api

import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/common_widgets/common_app_bar.dart';
import 'package:flutter/material.dart';

class EditBasicWidget extends StatefulWidget {
  const EditBasicWidget({super.key});

  @override
  _EditBasicWidgetState createState() => _EditBasicWidgetState();
}

class _EditBasicWidgetState extends State<EditBasicWidget> {
  List<String> options = [
    '👩‍🎓 Student',
    '👱🏻‍♀️ Women',
    '👤 183 cm',
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
    return Scaffold(
      backgroundColor: ThemeConfiguration.scaffoldBgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: CommonAppBar(
          title: StringConstants.myBasic,
          onEdit: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => const EditAccountScreen()),
            // );
          },
          onSetting: () {},
          editShow: false,
          settingShow: false,
          isBack: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
          child: Column(
            children: [
              const SizedBox(
                height: SizeConstants.maximumPadding,
              ),
              Center(
                child: Wrap(
                  spacing: SizeConstants.mainPagePadding,
                  runSpacing: SizeConstants.mainPagePadding,
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
                          horizontal: SizeConstants.mediumPadding,
                          vertical: SizeConstants.smallPadding,
                        ),
                        decoration: BoxDecoration(
                            color: selected[index]
                                ? ThemeConfiguration.descriptiveColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(35.0),
                            border: Border.all(
                              color: !selected[index]
                                  ? ThemeConfiguration.primaryColor
                                  : Colors.white,
                            )),
                        child: Text(
                          option,
                          style: TextStyle(
                            color: selected[index]
                                ? ThemeConfiguration.whiteColor
                                : ThemeConfiguration.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: SizeConstants.aboutFieldHeight,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  ImageConstants.saveBtn,
                  height: SizeConstants.buttonHeight,
                  width: MediaQuery.of(context).size.width / 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
