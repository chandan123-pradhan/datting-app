import 'package:dating_app/Pages/Login/Widgets/login_bottom_widget.dart';
import 'package:dating_app/Pages/Login/Widgets/login_header_widget.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:flutter/material.dart';

class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget({
    super.key,
    required this.mobileNumberController,
    required this.onTapLogin,
    this.isFrom="login",
  });

  final TextEditingController mobileNumberController;
  final VoidCallback onTapLogin;
  final String isFrom;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginHeaderWidget(mobileNumberController: mobileNumberController,isFrom: isFrom,),
              const SizedBox(height: SizeConstants.maximumPadding+SizeConstants.maximumPadding,),
              LoginBottomWidget(onTapLogin: onTapLogin)
            ],
          ),
        ),
      ),
    );
  }
}
