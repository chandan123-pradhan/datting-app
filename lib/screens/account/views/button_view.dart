import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/utils/image_utils.dart';
import 'package:flutter/material.dart';

class ButtonView extends StatelessWidget {
  const ButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height:SizeConstants.maximumPadding+SizeConstants.maximumPadding,
        ),
        Image.asset(
          ImageUtils.logoutButton,
          height: SizeConstants.buttonHeight,
          width: MediaQuery.of(context).size.width,
        ),
        const SizedBox(
          height: SizeConstants.mediumPadding,
        ),
        Image.asset(
          ImageUtils.deleteAccountButton,
          height: SizeConstants.buttonHeight,
          width: MediaQuery.of(context).size.width / 1,
        ),
      ],
    );
  }
}
