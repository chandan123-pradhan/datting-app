import 'package:dating_app/utils/constants.dart';
import 'package:dating_app/utils/image_utils.dart';
import 'package:flutter/material.dart';

class ButtonView extends StatelessWidget {
  const ButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(child: Image.asset(ImageUtils.logoutButton)),
        const SizedBox(width: Constant.mediumPadding,),
        Expanded(child: Image.asset(ImageUtils.deleteAccountButton)),
      ],
    );
  }
}
