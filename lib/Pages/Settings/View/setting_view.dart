import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Helper/loader_helper.dart';
import 'package:dating_app/Helper/navigation_helper.dart';
import 'package:dating_app/Helper/shared_preference_helper.dart';
import 'package:dating_app/Helper/toast_helper.dart';
import 'package:dating_app/Network/api_urls.dart';
import 'package:dating_app/Pages/Account/Widgets/account_button_widget.dart';
import 'package:dating_app/Pages/Settings/Bloc/setting_bloc.dart';
import 'package:dating_app/Pages/Settings/Bloc/setting_event.dart';
import 'package:dating_app/Pages/Settings/Bloc/setting_state.dart';
import 'package:dating_app/Pages/Settings/Model/setting_response_model.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/CommonWidgets/common_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool isToggleOn = true;
  SettingBloc? settingBloc;
  bool isLoading = false;
  SettingResponseModel? settingResponseModel;

  @override
  void initState() {
    settingBloc = context.read<SettingBloc>();
    settingBloc?.add(GetSettingData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildUi();
  }

  _buildUi() {
    return BlocBuilder<SettingBloc, SettingState>(
        builder: (context, currentState) {
      if (kDebugMode) {
        print(currentState);
      }
      if (currentState is SettingInitialState) {
      } else if (currentState is SettingLoadingState) {
        isLoading = true;
      } else if (currentState is SettingSuccessState) {
        isLoading = false;
        ToastHelper().showMsg(
            context: context,
            message: currentState.settingResponseModel?.message ?? '');
        settingResponseModel = currentState.settingResponseModel;
        settingBloc?.emit(SettingEmptyState());
      } else if (currentState is SettingErrorState) {
        isLoading = false;
        ToastHelper()
            .showErrorMsg(context: context, message: currentState.errorMessage);
      }
      return _buildMainUi();
    });
  }

  _buildMainUi() {
    return Stack(
      children: [
        Scaffold(
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: SizeConstants.mainPagePadding,
                      ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(StringConstants.notifications,
                                          style: ThemeConfiguration
                                              .commonTextStyle(
                                            16.0,
                                            FontWeight.w600,
                                            ThemeConfiguration
                                                .commonAppBarTitleColor,
                                          )),
                                      const SizedBox(
                                        height: SizeConstants.smallPadding,
                                      ),
                                      Text(
                                          StringConstants
                                              .notificationSettingSubTitle,
                                          style: ThemeConfiguration
                                              .commonTextStyle(
                                            14.0,
                                            FontWeight.w400,
                                            ThemeConfiguration.darkTextColor,
                                          )),
                                    ],
                                  ),
                                  Switch(
                                    value: isToggleOn,
                                    activeColor:
                                        ThemeConfiguration.primaryColor,
                                    onChanged: (value) {
                                      setState(() {
                                        isToggleOn = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: SizeConstants.maximumPadding +
                                    SizeConstants.maximumPadding,
                              ),
                              InkWell(
                                  onTap: () {
                                    Future.delayed(Duration.zero, () {
                                      Navigator.pushNamed(
                                          context, NavigationHelper.cms,
                                          arguments:
                                              ApiUrls.privacyPolicyEndPoint);
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(StringConstants.privacyPolicy,
                                          style: ThemeConfiguration
                                              .commonTextStyle(
                                            16.0,
                                            FontWeight.w600,
                                            ThemeConfiguration
                                                .commonAppBarTitleColor,
                                          )),
                                      const Icon(
                                        Icons.navigate_next,
                                        size: 25,
                                        color: ThemeConfiguration.primaryColor,
                                      )
                                    ],
                                  )),
                              const SizedBox(
                                height: SizeConstants.maximumPadding,
                              ),
                              InkWell(
                                onTap: () {
                                  Future.delayed(Duration.zero, () {
                                    Navigator.pushNamed(
                                        context, NavigationHelper.cms,
                                        arguments:
                                           ApiUrls.termsConditionEndPoint);
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(StringConstants.termsAndConditions,
                                        style:
                                            ThemeConfiguration.commonTextStyle(
                                          16.0,
                                          FontWeight.w600,
                                          ThemeConfiguration
                                              .commonAppBarTitleColor,
                                        )),
                                    const Icon(
                                      Icons.navigate_next,
                                      size: 25,
                                      color: ThemeConfiguration.primaryColor,
                                    )
                                  ],
                                ),
                              ),
                              const AccountButtonWidget(),
                            ],
                          )
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            )),
        Visibility(
          visible: isLoading == true,
          child: LoaderHelper.pageLoader(),
        )
      ],
    );
  }
}
