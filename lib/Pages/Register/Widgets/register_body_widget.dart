import 'package:dating_app/Pages/Login/Widgets/login_bottom_widget.dart';
import 'package:dating_app/Pages/Login/Widgets/login_header_widget.dart';
import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:flutter/material.dart';

class RegisterBodyWidget extends StatelessWidget {
  const RegisterBodyWidget({
    super.key,
    required this.mobileNumberController,
    required this.onTapLogin,
  });

  final TextEditingController mobileNumberController;
  final VoidCallback onTapLogin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const  EdgeInsets.symmetric(
        horizontal: SizeConstants.mainPagePadding,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoginHeaderWidget(
            mobileNumberController: mobileNumberController,
            isFrom: "signup",
          ),
          // LoginBottomWidget(onTapLogin: onTapLogin)
        ],
      ),
    );
  }
}
