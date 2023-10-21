import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Pages/Account/Widgets/account_button_widget.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/CommonWidgets/common_app_bar.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool isToggleOn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfiguration.scaffoldBgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: CommonAppBar(
          title: StringConstants.settings,
          onEdit: () {},
          onSetting: () {},
          editShow: false,
          settingShow: false,
          isShowDivider: true,
          isBack: true,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
           const Divider(
              color: ThemeConfiguration.primaryLightColor,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:  SizeConstants.mainPagePadding,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const SizedBox(
                      height: SizeConstants.mediumPadding,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(StringConstants.notifications,
                                    style: ThemeConfiguration.commonTextStyle(
                                      16.0,
                                      FontWeight.w600,
                                      ThemeConfiguration.commonAppBarTitleColor,
                                    )),
                                    const SizedBox(height: SizeConstants.smallPadding,),
                                                          Text(StringConstants.notificationSettingSubTitle,
                                style: ThemeConfiguration.commonTextStyle(
                                  14.0,
                                  FontWeight.w400,
                                  ThemeConfiguration.darkTextColor,
                                )),
                              ],
                            ),
                                                        Switch(
                              value: isToggleOn,
                              activeColor: ThemeConfiguration.primaryColor,
                              onChanged: (value) {
                                setState(() {
                                  isToggleOn = value;
                                });
                              },
                            ),
                          ],
                        ),
                                  
                       
                        const SizedBox(
                          height: SizeConstants.maximumPadding+SizeConstants.maximumPadding,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(StringConstants.privacyPolicy,
                                style: ThemeConfiguration.commonTextStyle(
                                  16.0,
                                  FontWeight.w600,
                                  ThemeConfiguration.commonAppBarTitleColor,
                                )),
                            const Icon(
                              Icons.navigate_next,
                              size: 25,
                              color: ThemeConfiguration.primaryColor,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: SizeConstants.maximumPadding,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(StringConstants.termsAndConditions,
                                style: ThemeConfiguration.commonTextStyle(
                                  16.0,
                                  FontWeight.w600,
                                  ThemeConfiguration.commonAppBarTitleColor,
                                )),
                            const Icon(
                              Icons.navigate_next,
                              size: 25,
                              color: ThemeConfiguration.primaryColor,
                            )
                          ],
                        ),

          const  AccountButtonWidget(),
                      ],
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

