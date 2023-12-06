// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/bottom_sheets/non_binary_bottom_sheet.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:flutter/material.dart';

class EditDobWidget extends StatefulWidget {
  int? selectedDaysValue;
  int? selectedMonthValue;
  String? selectedYearValue;
  Function(int)? isChangedDay;
  Function(int)? isChangedMonth;
  Function(String)? isChangedYear;
  List<String>? yearList;
  EditDobWidget({
    super.key,
    required this.selectedDaysValue,
    required this.selectedMonthValue,
    required this.selectedYearValue,
    required this.yearList,
    required this.isChangedDay,
    required this.isChangedMonth,
    required this.isChangedYear,
  });

  @override
  State<EditDobWidget> createState() => _EditDobWidgetState();
}

class _EditDobWidgetState extends State<EditDobWidget> {
  int? selectedDays;
  int? selectedMonths;
  String? selectedYear;
  @override
  void initState() {
    super.initState();
    selectedDays = widget.selectedDaysValue;
    selectedMonths = widget.selectedMonthValue;
    selectedYear = widget.selectedYearValue;
  }

  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                      value: widget.selectedDaysValue,
                      hint: const Text('DD'),
                      items: List<DropdownMenuItem<int>>.generate(31, (int index) {
                        return DropdownMenuItem<int>(
                          value: index + 1,
                          child: Text('${index + 1}'),
                        );
                      }),
                      onChanged: (newValue) {
                        widget.isChangedDay!(newValue!);
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
                      value: widget.selectedMonthValue,
                      hint: const Text('MM'),
                      items: List<DropdownMenuItem<int>>.generate(12, (int index) {
                        return DropdownMenuItem<int>(
                          value: index + 1,
                          child: Text('${index + 1}'),
                        );
                      }),
                      onChanged: (newValue) {
                        widget.isChangedMonth!(newValue!);
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
                    child: SizedBox(
                      height: SizeConstants.buttonHeight,
                      child: DropdownButton<String>(
                        underline: Container(),
                        value: widget.selectedYearValue,
                        hint: const Text('YEAR'),
                        items: widget.yearList
                            ?.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          widget.isChangedYear!(newValue!);
                        },
                      ),
                    ),
                  )
                ],
              )),
        ]);
  }
}