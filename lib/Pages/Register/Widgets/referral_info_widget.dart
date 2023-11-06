import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:flutter/material.dart';

class ReferralInfoWidget extends StatelessWidget {
  final TextEditingController referralCodeController;
  const ReferralInfoWidget({super.key, required this.referralCodeController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const  EdgeInsets.symmetric(
          horizontal:  SizeConstants.mainPagePadding,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: SizeConstants.mediumPadding,
          ),
          Text(
            StringConstants.refferalCodeEnterHere,
            style: ThemeConfiguration.registerHeadingTextStyle(),
          ),
          const SizedBox(
            height: SizeConstants.bigPadding,
          ),
          Padding(
            padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
            child: CommonWidgets.inputField(
                textInputType: TextInputType.name,
                hintText: StringConstants.refferalCode,
                context: context,
                textFieldController: referralCodeController),
          ),
        ],
      ),
    );
  }
}
