import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Pages/Account/Widgets/profile_body_card.dart';
import 'package:dating_app/Pages/Account/Widgets/profile_card_widget.dart';
import 'package:dating_app/Pages/Edit%20Account/Views/edit_account_view.dart';
import 'package:dating_app/Pages/Settings/View/setting_view.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/common_widgets/common_app_bar.dart';
import 'package:flutter/material.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeConfiguration.scaffoldBgColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: CommonAppBar(
            title: StringConstants.profile,
            onEdit: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EditAccountView()),
              );
            },
            onSetting: () {
                 Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SettingsView()),
              );
            },
            editShow: true,
            settingShow: true,
          ),
        ),
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
            child: Column(children: [
               ProfileCardWidget(),
               SizedBox(height: SizeConstants.maximumPadding),
               ProfileBodyCard(
                isFromEdit: false,
              ),
            
               SizedBox(
                height: SizeConstants.maximumPadding +
                    SizeConstants.maximumPadding +
                    SizeConstants.maximumPadding +
                    SizeConstants.maximumPadding +
                    SizeConstants.maximumPadding,
              ),
            ]),
          ),
        ));
  }
}
