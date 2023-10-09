import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Pages/Login/Widgets/login_bottom_widget.dart';
import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:flutter/material.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.mobileNumberController,
  });

  final TextEditingController mobileNumberController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: SizeConstants.mediumPadding,
        ),
        Text(
          StringConstants.login,
          style: ThemeConfiguration.headingTextStyle(),
        ),
        const SizedBox(
          height: SizeConstants.mediumPadding,
        ),
        Text(
          StringConstants.loginSubHeading,
          style: ThemeConfiguration.subHeadingTextStyle(),
        ),
        const SizedBox(
          height: SizeConstants.bigPadding,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: CommonWidgets.mobileNumberInputTextField(
              context: context, textFieldController: mobileNumberController),
        ),
            
      ],
    );
  }
}
