// ignore_for_file: library_private_types_in_public_api

import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Pages/Register/Model/interest_response_model.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:flutter/material.dart';

class ChooseInterestsWidget extends StatefulWidget {
  final InterestResponseModel? interestResponseModel;
  const ChooseInterestsWidget({super.key,required this.interestResponseModel});

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
            GridView.builder(
              itemCount: widget.interestResponseModel?.data.length??0,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3,
                  mainAxisSpacing: SizeConstants.mediumPadding,
                  crossAxisSpacing: SizeConstants.mediumPadding),
              itemBuilder: (context, index) {
                return Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                        color: ThemeConfiguration.primaryLightColor
                            .withOpacity(0.3),
                        borderRadius: BorderRadius.circular(35.0),
                        border: Border.all(
                          color: ThemeConfiguration.primaryColor,
                        )),
                    child: Center(
                      child: Text(
                        widget.interestResponseModel?.data[index].intrest??'',
                        style: const TextStyle(
                            color: ThemeConfiguration.descriptiveColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 11),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
