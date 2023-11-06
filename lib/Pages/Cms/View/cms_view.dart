import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Helper/loader_helper.dart';
import 'package:dating_app/Helper/toast_helper.dart';
import 'package:dating_app/Network/api_urls.dart';
import 'package:dating_app/Pages/Account/Widgets/account_button_widget.dart';
import 'package:dating_app/Pages/Cms/Bloc/cms_bloc.dart';
import 'package:dating_app/Pages/Cms/Bloc/cms_event.dart';
import 'package:dating_app/Pages/Cms/Bloc/cms_state.dart';
import 'package:dating_app/Pages/Cms/Model/cms_response_model.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/CommonWidgets/common_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CmsView extends StatefulWidget {
  final String? apiName;
  const CmsView({super.key, required this.apiName});

  @override
  State<CmsView> createState() => _CmsViewState();
}

class _CmsViewState extends State<CmsView> {
  bool isToggleOn = true;
  CmsBloc? cmsBloc;
  bool isLoading = false;
  CmsResponseModel? cmsResponseModel;

  @override
  void initState() {
    cmsBloc = context.read<CmsBloc>();
    fetchCmsData();
    super.initState();
  }

  fetchCmsData() {
    if (widget.apiName == ApiUrls.termsConditionEndPoint) {
      cmsBloc?.add(GetCmsDataEvent(widget.apiName));
    } else if (widget.apiName == ApiUrls.privacyPolicyEndPoint) {
      cmsBloc?.add(GetCmsDataEvent(widget.apiName));
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildUi();
  }

  _buildUi() {
    return BlocBuilder<CmsBloc, CmsState>(builder: (context, currentState) {
      if (kDebugMode) {
        print(currentState);
      }
      if (currentState is CmsInitialState) {
      } else if (currentState is CmsLoadingState) {
        isLoading = true;
      } else if (currentState is CmsSuccessState) {
        isLoading = false;
        cmsResponseModel = currentState.cmsResponseModel;
        cmsBloc?.emit(CmsEmptyState());
      } else if (currentState is CmsErrorState) {
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
                title: widget.apiName == ApiUrls.termsConditionEndPoint
                    ? StringConstants.termsAndConditions
                    : widget.apiName == ApiUrls.privacyPolicyEndPoint
                    ? StringConstants.privacyPolicy
                    : StringConstants.settings,
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
                  if((cmsResponseModel?.cmsDataList??[]).isNotEmpty)
                  Padding(
                    padding:
                        const EdgeInsets.all(SizeConstants.mainPagePadding),
                    child: Expanded(
                        child: SingleChildScrollView(
                            child: Center(
                      child: Html(
                        data: cmsResponseModel?.cmsDataList[0].content ??
                            StringConstants.noDataFound,
                      ),
                    ))),
                  ),

                  if(((cmsResponseModel?.cmsDataList??[]).isEmpty)&&(isLoading=false))
                    const Padding(
                      padding:
                       EdgeInsets.all(SizeConstants.mainPagePadding),
                      child: Expanded(
                          child: SingleChildScrollView(
                              child: Center(
                                child: Text(
                                      StringConstants.noDataFound,
                                ),
                              ))),
                    ),
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
