import 'dart:developer';
import 'package:dating_app/Pages/Account/View/Bloc/account_bloc.dart';
import 'package:dating_app/Pages/Account/View/Bloc/account_repository.dart';
import 'package:dating_app/Pages/Account/View/account_view.dart';
import 'package:dating_app/Pages/Cms/Bloc/cms_bloc.dart';
import 'package:dating_app/Pages/Cms/Bloc/cms_repository.dart';
import 'package:dating_app/Pages/Cms/View/cms_view.dart';
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
import 'package:dating_app/Pages/Settings/Bloc/setting_bloc.dart';
import 'package:dating_app/Pages/Settings/Bloc/setting_repository.dart';
import 'package:dating_app/Pages/Settings/View/setting_view.dart';
import 'package:dating_app/Pages/Splash/View/splash_view.dart';
import 'package:dating_app/screens/account/views/profile_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationHelper {
  static const String splash = "/splash";
  static const String register = '/register';
  static const String login = '/login';
  static const String otp = '/otp';
  static const String dashboard = '/dashboard';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String setting = '/settings';
  static const String cms = "/cms";
  static const String account = '/account';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => SplashView());

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
              create: (context) => LoginBloc(repository: LoginRepositoryImp()),
              child: const LoginView()),
        );

      case otp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<OtpBloc>(
              create: (context) => OtpBloc(repository: OtpRepositoryImp()),
              child: OtpView(mobileNumber: settings.arguments as String)),
        );

      case dashboard:
        return MaterialPageRoute(builder: (context) => const DashboardView());

      case setting:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SettingBloc>(
              create: (context) =>
                  SettingBloc(repository: SettingRepositoryImp()),
              child: const SettingsView()),
        );
      case account:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AccountBloc>(
              create: (context) =>
                  AccountBloc(repository: AccountRepositoryImp()),
              child: const AccountView()),
        );

      case cms:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CmsBloc>(
              create: (context) => CmsBloc(repository: CmsRepositoryImp()),
              child: CmsView(apiName: settings.arguments as String)),
        );

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
