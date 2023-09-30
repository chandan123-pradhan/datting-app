import 'package:dating_app/Pages/Register/View/register_view.dart';
import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginBottomWidget extends StatelessWidget {
  final VoidCallback onTapLogin;
  const LoginBottomWidget({
    super.key,
    required this.onTapLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonWidgets.mainBotton(
              title: StringConstants.login,
              context: context,
              onPressed: onTapLogin),
          const SizedBox(
            height: SizeConstants.maximumPadding,
          ),
          CommonWidgets.linkTextWidget(
              linkText: StringConstants.signup,
              text: StringConstants.dontHaveAnAccount,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const RegisterView();
                    },
                  ),
                );
              })
        ],
      ),
    ));
  }
}