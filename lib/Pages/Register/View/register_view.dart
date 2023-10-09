import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Pages/Dashboard/View/dashboard_view.dart';
import 'package:dating_app/Pages/Register/Widgets/choose_birthday_widget.dart';
import 'package:dating_app/Pages/Register/Widgets/choose_gender_widget.dart';
import 'package:dating_app/Pages/Register/Widgets/choose_interests_widget.dart';
import 'package:dating_app/Pages/Register/Widgets/register_info_widget.dart';
import 'package:dating_app/Pages/Register/Widgets/upload_photos_widget.dart';
import 'package:dating_app/Pages/Register/Widgets/write_about_widget.dart';
import 'package:dating_app/Pages/Register/Widgets/write_job_description_widget.dart';
import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
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
  TextEditingController jobDescriptionsController = TextEditingController();
  int currentstep = 1;
  List<int> days = List<int>.generate(31, (index) => index + 1);
  List<int> months = List<int>.generate(12, (index) => index + 1);
  int? selectedDays;
  int? selectedMonth;
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
  String? selectedYear;
  String selectedGender = 'women';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfiguration.scaffoldBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(SizeConstants.mainPagePadding,0.0,SizeConstants.mainPagePadding,SizeConstants.mainPagePadding),
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
                child: JobDescriptionWidget(
                  jobDescriptionsController: jobDescriptionsController,
                ),
              ),
              Visibility(
                  visible: currentstep == 6,
                  child: const ChooseInterestsWidget()),
              Visibility(
                  visible: currentstep == 7, child: const UploadPhotosWidget()),
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
                  linkText: '/7', text: '$currentstep', onTap: () {}),
              InkWell(
                onTap: () {
                  setState(() {
                    if (currentstep != 7) {
                      currentstep++;
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const DashboardView();
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
            percent: currentstep / 7,
            backgroundColor: ThemeConfiguration.primaryColor.withOpacity(0.2),
            progressColor: ThemeConfiguration.primaryColor,
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    ));
  }
}
