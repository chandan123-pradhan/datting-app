import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Helper/loader_helper.dart';
import 'package:dating_app/Helper/navigation_helper.dart';
import 'package:dating_app/Helper/toast_helper.dart';
import 'package:dating_app/Models/userdata_model.dart';
import 'package:dating_app/Network/api_urls.dart';
import 'package:dating_app/Pages/Account/Bloc/account_bloc.dart';
import 'package:dating_app/Pages/Account/Bloc/account_event.dart';
import 'package:dating_app/Pages/Account/Bloc/account_state.dart';
import 'package:dating_app/Pages/Account/Widgets/profile_body_card.dart';
import 'package:dating_app/Pages/Account/Widgets/profile_card_widget.dart';
import 'package:dating_app/Pages/Edit%20Account/Views/edit_account_view.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/CommonWidgets/common_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  AccountBloc? accountBloc;
  bool isLoading = false;
  UserDataModel? userDataModel;

  @override
  void initState() {
    accountBloc = context.read<AccountBloc>();
    accountBloc?.add(GetAccountData());
    userDataModel = UserDataModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildUi();
  }

  _buildUi() {
    return BlocBuilder<AccountBloc, AccountState>(
        builder: (context, currentState) {
      if (kDebugMode) {
        print(currentState);
      }
      if (currentState is AccountInitialState) {
      } else if (currentState is AccountLoadingState) {
        isLoading = true;
      } else if (currentState is AccountSuccessState) {
        isLoading = false;
        userDataModel = currentState.userDataModel;
        accountBloc?.emit(AccountEmptyState());
      } else if (currentState is AccountErrorState) {
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
                title: StringConstants.profile,
                onEdit: () {
                Navigator.pushNamed(context, NavigationHelper.editProfile);
                },
                onSetting: () {
                  Future.delayed(Duration.zero, () {
                    Navigator.pushNamed(context, NavigationHelper.setting);
                  });
                },
                editShow: true,
                settingShow: true,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
                child: Column(children: [
                  ProfileCardWidget(userDataModel: userDataModel),
                  const SizedBox(height: SizeConstants.maximumPadding),
                  ProfileBodyCard(
                      isFromEdit: false,
                      userDataModel: userDataModel),
                  const SizedBox(
                    height: SizeConstants.maximumPadding +
                        SizeConstants.maximumPadding +
                        SizeConstants.maximumPadding +
                        SizeConstants.maximumPadding +
                        SizeConstants.maximumPadding+
                        SizeConstants.maximumPadding +
                        SizeConstants.maximumPadding,
                  ),
                ]),
              ),
            )),
        Visibility(
          visible: isLoading == true,
          child: LoaderHelper.pageLoader(),
        )
      ],
    );
  }

  @override
  void dispose() {
    accountBloc?.close();
    super.dispose();
  }
}
