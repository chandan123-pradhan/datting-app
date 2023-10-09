import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:flutter/material.dart';

class JobDescriptionWidget extends StatelessWidget {
  final TextEditingController jobDescriptionsController;
  const JobDescriptionWidget({super.key, required this.jobDescriptionsController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: SizeConstants.mediumPadding,
        ),
        Text(
          StringConstants.jobDescriptions,
          style: ThemeConfiguration.registerHeadingTextStyle(),
        ),
        const SizedBox(
          height: SizeConstants.bigPadding,
        ),
        Padding(
          padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
          child: CommonWidgets.bigInputField(
              textInputType: TextInputType.text,
              hintText: StringConstants.jobDescriptionsHint,
              context: context,
              textFieldController: jobDescriptionsController),
        ),
      ],
    );
  }
}
