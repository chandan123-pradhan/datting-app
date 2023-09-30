import 'package:dating_app/Pages/Login/Widgets/login_body_widget.dart';
import 'package:dating_app/screens/auth_pages/verify_otp_page.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController mobileNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: LoginBodyWidget(
        mobileNumberController: mobileNumberController,
        onTapLogin: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return VerifyOpt(
                  mobileNumber: mobileNumberController.text,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
