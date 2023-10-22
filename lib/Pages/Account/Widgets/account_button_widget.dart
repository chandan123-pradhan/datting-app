import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Helper/navigation_helper.dart';
import 'package:dating_app/Helper/shared_preference_helper.dart';
import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/utils/image_utils.dart';
import 'package:flutter/material.dart';

class AccountButtonWidget extends StatelessWidget {
  const AccountButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: SizeConstants.maximumPadding + SizeConstants.maximumPadding,
        ),
        InkWell(
          onTap: () {
            showLogoutDialog(context);
          },
          child: Image.asset(
            ImageUtils.logoutButton,
            height: SizeConstants.buttonHeight,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        const SizedBox(
          height: SizeConstants.mediumPadding,
        ),
        InkWell(
          onTap: (){
            showDeleteAccountDialog(context);
          },
          child: Image.asset(
            ImageUtils.deleteAccountButton,
            height: SizeConstants.buttonHeight,
            width: MediaQuery.of(context).size.width / 1,
          ),
        ),
      ],
    );
  }

  /// Function to handle the logout action
  void logoutAndNavigateToLogin(BuildContext context) async {
    SharedPreferencesHelper.setIsLogin(false);
    Navigator.pushNamed(context, NavigationHelper.login);
  }

  ///Logout Dialog
  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(StringConstants.logoutDialogTitle,
              style: ThemeConfiguration.commonTextStyle(
                18.0,
                FontWeight.w700,
                ThemeConfiguration.primaryColor,
              )),
          content: Text(StringConstants.logoutDialogSubTitle,
              style: ThemeConfiguration.commonTextStyle(
                14.0,
                FontWeight.w500,
                ThemeConfiguration.darkTextColor,
              )),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(SizeConstants.smallPadding),
                    child: CommonWidgets.mainBotton(
                        title: StringConstants.cancel,
                        context: context,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        buttonColor: ThemeConfiguration.errorColor),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(SizeConstants.smallPadding),
                    child: CommonWidgets.mainBotton(
                      title: StringConstants.yes,
                      context: context,
                      onPressed: () {
                        logoutAndNavigateToLogin(context);
                      },
                        buttonColor: ThemeConfiguration.successColor
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }


  ///Delete Account Dialog
  void showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(StringConstants.deleteAccountDialogTitle,
              style: ThemeConfiguration.commonTextStyle(
                18.0,
                FontWeight.w700,
                ThemeConfiguration.primaryColor,
              )),
          content: Text(StringConstants.deleteAccountDialogSubTitle,
              style: ThemeConfiguration.commonTextStyle(
                14.0,
                FontWeight.w500,
                ThemeConfiguration.darkTextColor,
              )),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(SizeConstants.smallPadding),
                    child: CommonWidgets.mainBotton(
                        title: StringConstants.cancel,
                        context: context,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        buttonColor: ThemeConfiguration.errorColor),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(SizeConstants.smallPadding),
                    child: CommonWidgets.mainBotton(
                        title: StringConstants.yes,
                        context: context,
                        onPressed: () {
                          Navigator.of(context).pop();
                          // logoutAndNavigateToLogin(context);
                        },
                        buttonColor: ThemeConfiguration.successColor
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }


}
