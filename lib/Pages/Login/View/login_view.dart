import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Pages/Login/Widgets/login_body_widget.dart';
import 'package:dating_app/Pages/Otp/View/otp_view.dart';
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
      backgroundColor: ThemeConfiguration.scaffoldBgColor,
      body: Center(
        child: LoginBodyWidget(
          mobileNumberController: mobileNumberController,
          onTapLogin: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return OtpView(
                    mobileNumber: mobileNumberController.text,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
