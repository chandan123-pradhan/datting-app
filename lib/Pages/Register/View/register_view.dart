import 'package:dating_app/Pages/Register/Widgets/choose_birthday_widget.dart';
import 'package:dating_app/Pages/Register/Widgets/choose_gender_widget.dart';
import 'package:dating_app/Pages/Register/Widgets/choose_interests_widget.dart';
import 'package:dating_app/Pages/Register/Widgets/register_info_widget.dart';
import 'package:dating_app/Pages/Register/Widgets/upload_photos_widget.dart';
import 'package:dating_app/Pages/Register/Widgets/write_about_widget.dart';
import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/screens/dashboard_screens/dashbaord_screen.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  int currentstep = 1;
  List<int> days = List<int>.generate(31, (index) => index + 1);
  List<int> months = List<int>.generate(12, (index) => index + 1);
  int? selectedDays;
  int? selectedMonth;
  List<String> yearList = [
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
  ];
  String? selectedYear;
  String selectedGender = 'women';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
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
              const SizedBox(
                height: SizeConstants.bigPadding,
              ),
              Visibility(
                  visible: currentstep == 1,
                  child: RegisterInfoWidget(
                      fullNameController: fullNameController)),
              Visibility(
                  visible: currentstep == 2,
                  child: ChooseBirthdayWidget(
                    selectedDaysValue: selectedDays,
                    selectedMonthValue: selectedMonth,
                    selectedYearValue: selectedYear,
                    yearList: yearList,
                  )),
              Visibility(
                  visible: currentstep == 3,
                  child: ChooseGenderWidget(
                    selectedGenderValue: selectedGender,
                  )),
              Visibility(
                visible: currentstep == 4,
                child: WriteAboutWidget(
                  aboutController: aboutController,
                ),
              ),
              Visibility(
                  visible: currentstep == 5,
                  child: const ChooseInterestsWidget()),
              Visibility(
                  visible: currentstep == 6, child: const UploadPhotosWidget()),
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
                  linkText: '/6', text: '$currentstep', onTap: () {}),
              InkWell(
                onTap: () {
                  setState(() {
                    if (currentstep != 6) {
                      currentstep++;
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const DashboardScreen();
                          },
                        ),
                      );
                    }
                  });
                },
                child: Image.asset(
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
            percent: currentstep / 6,
            backgroundColor: ColorConstant.linkColor.withOpacity(0.2),
            progressColor: ColorConstant.linkColor,
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    ));
  }
}
