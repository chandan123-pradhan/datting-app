import 'package:dating_app/common_widgets/common_app_bar.dart';
import 'package:dating_app/screens/account/views/button_view.dart';
import 'package:dating_app/screens/account/views/option_card_view.dart';
import 'package:dating_app/screens/account/views/options_view.dart';
import 'package:dating_app/screens/account/views/profile_body_card.dart';
import 'package:dating_app/screens/account/views/profile_card_view.dart';
import 'package:dating_app/screens/edit_account/edit_account_screen.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/constants.dart';
import 'package:dating_app/utils/string_utils.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.scaffoldBgColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Constant.mainPagePadding),
              child: Column(children: [
                CommonAppBar(
                  title: StringUtils.profile,
                  onEdit: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditAccountScreen()),
                    );
                  },
                  onSetting: () {},
                  editShow: true,
                  settingShow: true,
                ),
                SizedBox(height: Constant.mediumPadding),
                ProfileCardView(),
                SizedBox(height: Constant.maximumPadding),
                ProfileBodyCard(isFromEdit: false,),
                SizedBox(
                  height: Constant.maximumPadding +
                      Constant.maximumPadding +
                      Constant.maximumPadding,
                ),
              ]),
            ),
          ),
        ));
  }
}
