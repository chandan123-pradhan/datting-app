import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:flutter/material.dart';

class RegisterInfoWidget extends StatelessWidget {
  final TextEditingController fullNameController;
  const RegisterInfoWidget({super.key, required this.fullNameController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: SizeConstants.mediumPadding,
        ),
        Text(
          StringConstants.whatIsYourName,
          style: ThemeConfiguration.registerHeadingTextStyle(),
        ),
        const SizedBox(
          height: SizeConstants.bigPadding,
        ),
        Padding(
          padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
          child: CommonWidgets.inputField(
              textInputType: TextInputType.name,
              hintText: StringConstants.fullName,
              context: context,
              textFieldController: fullNameController),
        ),
      ],
    );
  }
}
