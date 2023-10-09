// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/bottom_sheets/non_binary_bottom_sheet.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:flutter/material.dart';

class ChooseBirthdayWidget extends StatefulWidget {
  int? selectedDaysValue;
  int? selectedMonthValue;
  String? selectedYearValue;
  List<String>? yearList;
  ChooseBirthdayWidget(
      {super.key,
      required this.selectedDaysValue,
      required this.selectedMonthValue,
      required this.selectedYearValue,
      required this.yearList});

  @override
  State<ChooseBirthdayWidget> createState() => _ChooseBirthdayWidgetState();
}

class _ChooseBirthdayWidgetState extends State<ChooseBirthdayWidget> {
  var selectedDays;
  var selectedMonths;
  var selectedYear;
  @override
  void initState() {
    super.initState();
    selectedDays = widget.selectedDaysValue;
  }

  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: SizeConstants.mediumPadding,
      ),
      Text(
        StringConstants.whatIsYouBirthday,
        style: ThemeConfiguration.registerHeadingTextStyle(),
      ),
      const SizedBox(
        height: SizeConstants.bigPadding,
      ),
      Padding(
          padding: const EdgeInsets.fromLTRB(SizeConstants.mainPagePadding, 0,
              SizeConstants.mainPagePadding, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: SizeConstants.buttonHeight,
                width: MediaQuery.of(context).size.width / 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        SizeConstants.normalCardBorderRadius),
                    border: Border.all(
                        width: 0.5,
                        color: ThemeConfiguration.primaryLightColor)),
                alignment: Alignment.center,
                child: DropdownButton<int>(
                  underline: Container(),
                  value: selectedDays,
                  hint: Text('DD'),
                  items: List<DropdownMenuItem<int>>.generate(31, (int index) {
                    return DropdownMenuItem<int>(
                      value: index + 1,
                      child: Text('${index + 1}'),
                    );
                  }),
                  onChanged: (newValue) {
                    setState(() {
                      selectedDays = newValue!;
                    });
                  },
                ),
              ),
              Container(
                height: SizeConstants.buttonHeight,
                width: MediaQuery.of(context).size.width / 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        SizeConstants.normalCardBorderRadius),
                    border: Border.all(
                        width: 0.5,
                        color: ThemeConfiguration.primaryLightColor)),
                alignment: Alignment.center,
                child: DropdownButton<int>(
                  underline: Container(),
                  value: selectedMonths,
                  hint: Text('MM'),
                  items: List<DropdownMenuItem<int>>.generate(12, (int index) {
                    return DropdownMenuItem<int>(
                      value: index + 1,
                      child: Text('${index + 1}'),
                    );
                  }),
                  onChanged: (newValue) {
                    setState(() {
                      selectedMonths = newValue!;
                    });
                  },
                ),
              ),
              Container(
                height: SizeConstants.buttonHeight,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        SizeConstants.normalCardBorderRadius),
                    border: Border.all(
                        width: 0.5,
                        color: ThemeConfiguration.primaryLightColor)),
                alignment: Alignment.center,
                child: SizedBox(  height: SizeConstants.buttonHeight,
                
                  child: DropdownButton<String>(
                    
                    underline: Container(),
                    value: selectedYear,
                    hint: Text('YEAR'),
                    items: widget.yearList
                        ?.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedYear = newValue!;
                      });
                    },
                  ),
                ),
              )
            ],
          )),
    ]);
  }
}
