import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Helper/loader_helper.dart';
import 'package:dating_app/Helper/shared_preference_helper.dart';
import 'package:dating_app/Helper/toast_helper.dart';
import 'package:dating_app/Models/userdata_model.dart';
import 'package:dating_app/Pages/Dashboard/View/dashboard_view.dart';
import 'package:dating_app/Pages/Login/Widgets/login_body_widget.dart';
import 'package:dating_app/Pages/Otp/Widgets/otp_header_widget.dart';
import 'package:dating_app/Pages/Register/Bloc/register_bloc.dart';
import 'package:dating_app/Pages/Register/Bloc/register_event.dart';
import 'package:dating_app/Pages/Register/Bloc/register_state.dart';
import 'package:dating_app/Pages/Register/Widgets/choose_birthday_widget.dart';
import 'package:dating_app/Pages/Register/Widgets/choose_gender_widget.dart';
import 'package:dating_app/Pages/Register/Widgets/choose_interests_widget.dart';
import 'package:dating_app/Pages/Register/Widgets/register_body_widget.dart';
import 'package:dating_app/Pages/Register/Widgets/register_info_widget.dart';
import 'package:dating_app/Pages/Register/Widgets/upload_photos_widget.dart';
import 'package:dating_app/Pages/Register/Widgets/write_about_widget.dart';
import 'package:dating_app/Pages/Register/Widgets/write_job_description_widget.dart';
import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController jobDescriptionsController = TextEditingController();
  int currentstep = 1;
  List<int> days = List<int>.generate(31, (index) => index + 1);
  List<int> months = List<int>.generate(12, (index) => index + 1);
  int selectedDays = 1;
  int selectedMonth = 1;
  List<String> yearList = [
    '1970',
    '1971',
    '1972',
    '1973',
    '1974',
    '1975',
    '1976',
    '1977',
    '1978',
    '1979',
    '1980',
    '1981',
    '1982',
    '1983',
    '1984',
    '1985',
    '1986',
    '1987',
    '1988',
    '1989',
    '1990',
    '1991',
    '1992',
    '1993',
    '1994',
    '1995',
    '1996',
    '1997',
    '1998',
    '1999',
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '2010',
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023',
  ];
  String? selectedYear = "1970";
  String selectedGender = 'women';
  int? otp;
  bool timerActive = true;

  ///Api
  RegisterBloc? registerBloc;
  bool isLoading = false;

  @override
  void initState() {
    registerBloc = context.read<RegisterBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildUi();
  }

  _buildUi() {
    return BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, currentState) {
      if (kDebugMode) {
        print(currentState);
      }
      if (currentState is RegisterInitialState) {
      } else if (currentState is RegisterLoadingState) {
        isLoading = true;
      } else if (currentState is RegisterSuccessState) {
        isLoading = false;
        currentstep++;
        ToastHelper().showMsg(
            context: context, message: currentState.baseModel?.message ?? '');
        registerBloc?.emit(RegisterEmptyState());
      } else if (currentState is RegisterMobileNumberSuccessState) {
        isLoading = false;
        currentstep++;
        ToastHelper().showMsg(
            context: context,
            message: currentState.registerMobileNumberModel?.message ?? '');
        SharedPreferencesHelper.saveUserInformation(
            isRegister:
                currentState.registerMobileNumberModel?.data.isRegistered == 1
                    ? true
                    : false,
            token: currentState.registerMobileNumberModel?.data.token ?? '');
        registerBloc?.emit(RegisterEmptyState());
      } else if (currentState is RegisterFullNameSuccessState) {
        isLoading = false;
        currentstep++;
        ToastHelper().showMsg(
            context: context,
            message: currentState.userDataModel?.message ?? '');
        var authToken = SharedPreferencesHelper.getToken();
        var isRegister = SharedPreferencesHelper.getIsRegister();
        SharedPreferencesHelper.saveUserData(
            userData: UserData(
                firstName: currentState.userDataModel?.data?.firstName ?? '',
                lastName: currentState.userDataModel?.data?.lastName ?? '',
                notification:
                    currentState.userDataModel?.data?.notification ?? 0,
                interests: currentState.userDataModel?.data?.interests ?? [],
                about: currentState.userDataModel?.data?.about ?? '',
                approved: currentState.userDataModel?.data?.approved ?? false,
                wallet: currentState.userDataModel?.data?.wallet ?? 0,
                id: currentState.userDataModel?.data?.id ?? '',
                mobileNumber:
                    currentState.userDataModel?.data?.mobileNumber ?? '',
                userReferralCode:
                    currentState.userDataModel?.data?.userReferralCode ?? '',
                createdAt: currentState.userDataModel?.data?.createdAt ?? '',
                updatedAt: currentState.userDataModel?.data?.updatedAt ?? ''));
        registerBloc?.emit(RegisterEmptyState());
      } else if (currentState is RegisterErrorState) {
        isLoading = false;
        ToastHelper()
            .showErrorMsg(context: context, message: currentState.errorMessage);
      }
      registerBloc?.emit(RegisterEmptyState());
      return _buildMainUi();
    });
  }

  _buildMainUi() {
    return Scaffold(
      backgroundColor: ThemeConfiguration.scaffoldBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(SizeConstants.mainPagePadding, 0.0,
              SizeConstants.mainPagePadding, SizeConstants.mainPagePadding),
          child: Column(
            children: [
              Row(
                children: [
                  CommonWidgets.backBottonWidget(onTap: () {
                    if (currentstep == 1) {
                      Navigator.pop(context);
                    } else {
                      currentstep--;
                      setState(() {});
                    }
                  }),
                ],
              ),
              const Spacer(),
              Visibility(
                visible: currentstep == 1,
                child: RegisterBodyWidget(
                  mobileNumberController: mobileNumberController,
                  onTapLogin: () {
                    if (mobileNumberController.text.isEmpty) {
                      ToastHelper().showErrorMsg(
                          context: context,
                          message:
                              StringConstants.phoneNumberRequiredValidationMsg);
                    } else {
                      if (kDebugMode) {
                        print(mobileNumberController.text);
                      }
                      registerBloc?.add(OtpRequestEvent(
                          int.tryParse(mobileNumberController.text)));
                    }
                  },
                ),
              ),
              Visibility(
                visible: currentstep == 2,
                child: OtpHeaderWidget(
                  mobileNumber: mobileNumberController.text.toString(),
                  callBack: (pin) {
                    setState(() {
                      otp = int.tryParse(pin);
                    });
                  },
                  updateTimerActiveCallback: (bool isActive) {
                    setState(() {
                      timerActive = isActive;
                    });
                  },
                  timerActive: timerActive,
                ),
              ),
              Visibility(
                  visible: currentstep == 3,
                  child: RegisterInfoWidget(
                      fullNameController: fullNameController)),
              Visibility(
                  visible: currentstep == 4,
                  child: ChooseBirthdayWidget(
                    selectedDaysValue: selectedDays,
                    selectedMonthValue: selectedMonth,
                    selectedYearValue: selectedYear,
                    yearList: yearList,
                    isChangedDay: (newValue) {
                      setState(() {
                        selectedDays = newValue;
                      });
                    },
                    isChangedMonth: (newValue) {
                      setState(() {
                        selectedMonth = newValue;
                      });
                    },
                    isChangedYear: (newValue) {
                      setState(() {
                        selectedYear = newValue;
                      });
                    },
                  )),
              Visibility(
                  visible: currentstep == 5,
                  child: ChooseGenderWidget(
                    selectedGenderValue: selectedGender,
                  )),
              Visibility(
                visible: currentstep == 6,
                child: WriteAboutWidget(
                  aboutController: aboutController,
                ),
              ),
              Visibility(
                visible: currentstep == 7,
                child: JobDescriptionWidget(
                  jobDescriptionsController: jobDescriptionsController,
                ),
              ),
              Visibility(
                  visible: currentstep == 8,
                  child: const ChooseInterestsWidget()),
              Visibility(
                  visible: currentstep == 9, child: const UploadPhotosWidget()),
              _bottomView(),
            ],
          ),
        ),
      ),
    );
  }

  _bottomView() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonWidgets.showPageNumberWidget(
                  linkText: '/10', text: '$currentstep', onTap: () {}),
              InkWell(
                onTap: () {
                  if (currentstep == 1) {
                    if (mobileNumberController.text.isEmpty) {
                      ToastHelper().showErrorMsg(
                          context: context,
                          message:
                              StringConstants.phoneNumberRequiredValidationMsg);
                    } else {
                      if (kDebugMode) {
                        print(mobileNumberController.text);
                      }
                      registerBloc?.add(OtpRequestEvent(
                          int.tryParse(mobileNumberController.text)));
                    }
                  } else if (currentstep == 2) {
                    if (otp == null) {
                      ToastHelper().showErrorMsg(
                          context: context,
                          message: StringConstants.otpRequiredValidationMsg);
                    } else {
                      if (kDebugMode) {
                        print(mobileNumberController.text);
                        print(otp);
                      }
                      registerBloc?.add(VerifyOtpEvent(
                          int.tryParse(mobileNumberController.text.toString()),
                          otp));
                    }
                  } else if (currentstep == 3) {
                    if (fullNameController.text.isEmpty) {
                      ToastHelper().showErrorMsg(
                          context: context,
                          message: StringConstants.fullNameValidMsg);
                    } else {
                      if (kDebugMode) {
                        print(fullNameController.text);
                      }

                      registerBloc
                          ?.add(RegisterFullNameEvent(fullNameController.text));
                    }
                  } else if (currentstep == 4) {
                    var dob =
                        "${(selectedDays ?? 0)}/${(selectedMonth ?? 0)}/${selectedYear ?? 0}";
                    if (kDebugMode) {
                      print(dob);
                    }
                    registerBloc?.add(RegisterDobEvent(dob.toString()));
                  } else if (currentstep == 5) {
                    if (kDebugMode) {
                      print(selectedGender);
                    }
                    registerBloc?.add(RegisterGenderEvent(selectedGender.toString()));
                  }else if (currentstep == 6) {
                    if (aboutController.text.isEmpty) {
                      ToastHelper().showErrorMsg(
                          context: context,
                          message:
                          StringConstants.aboutYourSelfValidMsg);
                    } else {
                      if (kDebugMode) {
                        print(aboutController.text);
                      }
                      registerBloc?.add(RegisterAboutEvent(
                         aboutController.text.toString()));
                    }
                  } else if (currentstep == 7) {
                    if (jobDescriptionsController.text.isEmpty) {
                      ToastHelper().showErrorMsg(
                          context: context,
                          message:
                          StringConstants.jobDescriptionsValidMsg);
                    } else {
                      if (kDebugMode) {
                        print(jobDescriptionsController.text);
                      }
                      currentstep++;
                      // registerBloc?.add(RegisterAboutEvent(
                      //     jobDescriptionsController.text.toString()));
                    }
                  }else {
                    setState(() {
                      if (currentstep != 10) {
                        if (currentstep == 2) {}
                      } else {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return const DashboardView();
                        //     },
                        //   ),
                        // );
                      }
                    });
                  }
                },
                child: isLoading == true
                    ? LoaderHelper.pageLoader()
                    : Image.asset(
                        ImageConstants.nextBtn,
                        height: SizeConstants.registerButtonHeight,
                        width: SizeConstants.registerButtonHeight,
                      ),
              )
            ],
          ),
          const SizedBox(
            height: SizeConstants.mediumPadding,
          ),
          LinearPercentIndicator(
            percent: currentstep / 10,
            backgroundColor: ThemeConfiguration.primaryColor.withOpacity(0.2),
            progressColor: ThemeConfiguration.primaryColor,
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    ));
  }
}
