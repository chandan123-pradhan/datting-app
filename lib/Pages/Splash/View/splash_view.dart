import 'package:dating_app/Helper/navigation_helper.dart';
import 'package:dating_app/Helper/shared_preference_helper.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/utils/image_utils.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () async {
      bool isLoggedIn = await SharedPreferencesHelper.getIsLogin() == true;

      if (isLoggedIn == true) {
        Future.delayed(Duration.zero, () {
          Navigator.pushNamed(
            context,
            NavigationHelper.dashboard,
          );
        });
      } else {
        Future.delayed(Duration.zero, () {
          Navigator.pushNamed(
            context,
            NavigationHelper.login,
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Image.asset(
      ImageUtils.shieldTickButton,
      height: 150,
      width: 150,
    )));
  }
}
