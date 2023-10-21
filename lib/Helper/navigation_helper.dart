import 'dart:developer';
import 'package:dating_app/Pages/Dashboard/View/dashboard_view.dart';
import 'package:dating_app/Pages/Otp/Bloc/otp_bloc.dart';
import 'package:dating_app/Pages/Otp/Bloc/otp_repository.dart';
import 'package:dating_app/Pages/Otp/View/otp_view.dart';
import 'package:dating_app/Pages/Register/Bloc/register_bloc.dart';
import 'package:dating_app/Pages/Register/View/register_view.dart';
import 'package:dating_app/Pages/Login/Bloc/login_bloc.dart';
import 'package:dating_app/Pages/Login/Bloc/login_repository.dart';
import 'package:dating_app/Pages/Login/View/login_view.dart';
import 'package:dating_app/Pages/Register/Bloc/register_repository.dart';
import 'package:dating_app/screens/account/views/profile_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationHelper {
  static const String register = '/register';
  static const String login = '/login';
  static const String otp = '/otp';
  static const String dashboard = '/dashboard';
  static const String home = '/home';
  static const String profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<RegisterBloc>(
              create: (context) =>
                  RegisterBloc(repository: RegisterRepositoryImp()),
              child: const RegisterView()),
        );

      case login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginBloc>(
              create: (context) =>
                  LoginBloc(repository: LoginRepositoryImp()),
              child: const LoginView()),
        );

      case otp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<OtpBloc>(
              create: (context) =>
                  OtpBloc(repository: OtpRepositoryImp()),
              child:  OtpView(mobileNumber:settings.arguments as String)),
        );

      case dashboard:
        return MaterialPageRoute(builder: (context) => const DashboardView());


      case home:
        return MaterialPageRoute(builder: (context) => const DashboardView());
      case profile:
        return MaterialPageRoute(builder: (context) => const ProfileCardView());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Route not found!'),
            ),
          ),
        );
    }
  }
}
