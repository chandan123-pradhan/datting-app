import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:flutter/material.dart';

class WriteAboutWidget extends StatelessWidget {
  final TextEditingController aboutController;
  const WriteAboutWidget({super.key, required this.aboutController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: SizeConstants.mediumPadding,
          ),
          Text(
            StringConstants.aboutYourSelf,
            style: ThemeConfiguration.registerHeadingTextStyle(),
          ),
          const SizedBox(
            height: SizeConstants.bigPadding,
          ),
          Padding(
            padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
            child: CommonWidgets.bigInputField(
                textInputType: TextInputType.name,
                hintText: StringConstants.aboutYourSelfHint,
                context: context,
                textFieldController: aboutController),
          ),
        ],
      ),
    );
  }
}
