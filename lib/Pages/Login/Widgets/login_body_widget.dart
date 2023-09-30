import 'package:dating_app/Pages/Login/Widgets/login_bottom_widget.dart';
import 'package:dating_app/Pages/Login/Widgets/login_header_widget.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:flutter/material.dart';

class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget({
    super.key,
    required this.mobileNumberController,
    required this.onTapLogin,
  });

  final TextEditingController mobileNumberController;
  final VoidCallback onTapLogin;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
        child: Column(
          children: [
            LoginHeaderWidget(mobileNumberController: mobileNumberController),
            LoginBottomWidget(onTapLogin: onTapLogin)
          ],
        ),
      ),
    );
  }
}