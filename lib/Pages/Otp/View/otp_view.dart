import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Helper/loader_helper.dart';
import 'package:dating_app/Helper/navigation_helper.dart';
import 'package:dating_app/Helper/toast_helper.dart';
import 'package:dating_app/Pages/Dashboard/View/dashboard_view.dart';
import 'package:dating_app/Pages/Otp/Bloc/otp_bloc.dart';
import 'package:dating_app/Pages/Otp/Bloc/otp_event.dart';
import 'package:dating_app/Pages/Otp/Bloc/otp_state.dart';
import 'package:dating_app/Pages/Otp/Widgets/otp_header_widget.dart';
import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpView extends StatefulWidget {
  final String? mobileNumber;
  const OtpView({super.key, required this.mobileNumber});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  OtpBloc? otpBloc;
  bool isLoading = false;
  int? otp;
  bool timerActive = true;

  @override
  void initState() {
    otpBloc = context.read<OtpBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildUi();
  }

  _buildUi() {
    return BlocBuilder<OtpBloc, OtpState>(builder: (context, currentState) {
      if (kDebugMode) {
        print(currentState);
      }
      if (currentState is OtpInitialState) {
      } else if (currentState is OtpLoadingState) {
        isLoading = true;
      } else if (currentState is OtpSuccessState) {
        isLoading = false;
        ToastHelper().showMsg(
            context: context, message: currentState.registerMobileNumberModel?.message ?? '');
        otpBloc?.emit(OtpEmptyState());
        Future.delayed(Duration.zero, () {
          Navigator.pushNamed(context, NavigationHelper.dashboard);
        });
      } else if (currentState is OtpErrorState) {
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
          body: Center(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
                child: Stack(
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: SizeConstants.maximumPadding +
                                SizeConstants.maximumPadding +
                                SizeConstants.maximumPadding,
                          ),
                          OtpHeaderWidget(
                            mobileNumber: widget.mobileNumber.toString(),
                            callBack: (pin) {
                              setState(() {
                                otp = int.tryParse(pin);
                              });
                            },
                            updateTimerActiveCallback:(bool isActive) {
                              setState(() {
                                timerActive = isActive;
                              });
                            },
                            timerActive: timerActive,
                          ),
                          const SizedBox(
                            height: SizeConstants.maximumPadding +
                                SizeConstants.maximumPadding,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(
                                SizeConstants.mainPagePadding),
                            child: CommonWidgets.mainBotton(
                              title: StringConstants.verify,
                              context: context,
                              onPressed: () {
                                if (otp == null) {
                                  ToastHelper().showErrorMsg(
                                      context: context,
                                      message: StringConstants
                                          .otpRequiredValidationMsg);
                                } else {
                                  if (kDebugMode) {
                                    print(widget.mobileNumber);
                                    print(otp);
                                  }
                                  otpBloc?.add(VerifyOtpEvent(
                                      int.tryParse(
                                          widget.mobileNumber.toString()),
                                      otp));
                                }
                              },
                              buttonColor: timerActive == true
                                  ? ThemeConfiguration.buttonColor
                                  : ThemeConfiguration.dullTextColor,
                            ),
                          ),
                          const SizedBox(
                            height: SizeConstants.maximumPadding,
                          ),
                        ]),
                    CommonWidgets.backBottonWidget(onTap: () {
                      Navigator.pop(context);
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: isLoading == true,
          child: LoaderHelper.pageLoader(),
        )
      ],
    );
  }
}
