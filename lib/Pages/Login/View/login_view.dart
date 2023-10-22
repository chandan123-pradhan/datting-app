import 'dart:developer';

import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Helper/loader_helper.dart';
import 'package:dating_app/Helper/navigation_helper.dart';
import 'package:dating_app/Helper/shared_preference_helper.dart';
import 'package:dating_app/Helper/toast_helper.dart';
import 'package:dating_app/Models/base_model.dart';
import 'package:dating_app/Pages/Login/Bloc/login_bloc.dart';
import 'package:dating_app/Pages/Login/Bloc/login_event.dart';
import 'package:dating_app/Pages/Login/Bloc/login_repository.dart';
import 'package:dating_app/Pages/Login/Bloc/login_state.dart';
import 'package:dating_app/Pages/Login/Widgets/login_body_widget.dart';
import 'package:dating_app/Pages/Otp/View/otp_view.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController mobileNumberController = TextEditingController();
  LoginBloc? loginBloc;
  bool isLoading = false;

  @override
  void initState() {
    loginBloc = context.read<LoginBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildUi();
  }

  _buildUi() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, currentState) {
      if (kDebugMode) {
        print(currentState);
      }
      if (currentState is LoginInitialState) {
      } else if (currentState is LoginLoadingState) {
        isLoading = true;
      } else if (currentState is LoginSuccessState) {
        isLoading = false;
        ToastHelper().showMsg(
            context: context, message: currentState.baseModel?.message ?? '');
       loginBloc?.emit(LoginEmptyState());
        Future.delayed(Duration.zero, () {
          Navigator.pushNamed(context, NavigationHelper.otp, arguments: mobileNumberController.text);
        });
      } else if (currentState is LoginErrorState) {
        isLoading = false;
        ToastHelper()
            .showErrorMsg(context: context, message: currentState.errorMessage);
      }
      return _buildMainUi();
    });
  }

  _buildMainUi() {
    return Scaffold(
      backgroundColor: ThemeConfiguration.scaffoldBgColor,
      body: Stack(
        children: [
          Center(
            child: LoginBodyWidget(
              mobileNumberController: mobileNumberController,
              onTapLogin: () {
                if (mobileNumberController.text.isEmpty) {
                  ToastHelper().showErrorMsg(
                      context: context,
                      message:
                          StringConstants.phoneNumberRequiredValidationMsg);
                } else {
                  if (kDebugMode) {
                    print(mobileNumberController.text);
                  }
                  loginBloc?.add(OtpRequestEvent(
                      int.tryParse(mobileNumberController.text)));
                }
              },
            ),
          ),
          Visibility(
            visible: isLoading == true,
            child: LoaderHelper.pageLoader(),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    loginBloc?.close();
    super.dispose();
  }
}
