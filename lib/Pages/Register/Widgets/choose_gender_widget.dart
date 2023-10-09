// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/bottom_sheets/non_binary_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ChooseGenderWidget extends StatefulWidget {
  String? selectedGenderValue;
  ChooseGenderWidget({super.key, required this.selectedGenderValue});

  @override
  State<ChooseGenderWidget> createState() => _ChooseGenderWidgetState();
}

class _ChooseGenderWidgetState extends State<ChooseGenderWidget> {
  var selectedGender;
  @override
  void initState() {
    super.initState();
    selectedGender = widget.selectedGenderValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: SizeConstants.mediumPadding,
      ),
      Text(
        StringConstants.whatIsYourGender,
        style: ThemeConfiguration.headingTextStyle(),
      ),
      const SizedBox(
        height: SizeConstants.bigPadding,
      ),
      Padding(
          padding: const EdgeInsets.fromLTRB(SizeConstants.mainPagePadding, 0,
              SizeConstants.mainPagePadding, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _genderManView(),
                  _genderWomenView(),
                ],
              ),
              // const SizedBox(
              //   height: SizeConstants.bigPadding,
              // ),
              // _genderOthersView(),
            ],
          ))
    ]);
  }

  _genderManView() {
    return InkWell(
      onTap: () {
        setState(() {
          selectedGender = 'man';
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: selectedGender == "man"
                      ? Border.all(
                          width: 1, color: ThemeConfiguration.descriptiveColor)
                      : Border.all(width: 1, color: Colors.transparent)),
              height: SizeConstants.genderContainerSize,
              width: MediaQuery.of(context).size.width / 2.8,
              alignment: Alignment.center,
              child: Image.asset(
                ImageConstants.manIcon,
                height: SizeConstants.genderIconSize,
                width: SizeConstants.genderIconSize,
              )),
          Positioned(
              bottom: SizeConstants.mainPagePadding,
              child: Text(
                StringConstants.man,
                style: ThemeConfiguration.richText1TextStyle(),
              )),
          Visibility(
            visible: selectedGender == 'man',
            child: const Positioned(
                right: SizeConstants.mainPagePadding,
                top: SizeConstants.mainPagePadding,
                child: Icon(
                  Icons.check_circle,
                  size: SizeConstants.maximumPadding,
                  color: ThemeConfiguration.primaryColor,
                )),
          ),
        ],
      ),
    );
  }

  _genderWomenView() {
    return InkWell(
      onTap: () {
        setState(() {
          selectedGender = 'women';
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: selectedGender == 'women'
                    ? Border.all(
                        width: 1, color: ThemeConfiguration.descriptiveColor)
                    : Border.all(width: 1, color: Colors.transparent)),
            height: SizeConstants.genderContainerSize,
            width: MediaQuery.of(context).size.width / 2.8,
            alignment: Alignment.center,
            child: Image.asset(
              ImageConstants.womenIcon,
              height: SizeConstants.genderIconSize,
              width: SizeConstants.genderIconSize,
            ),
          ),
          Positioned(
              bottom: SizeConstants.mainPagePadding,
              child: Text(
                StringConstants.women,
                style: ThemeConfiguration.richText1TextStyle(),
              )),
          Visibility(
            visible: selectedGender == 'women',
            child: const Positioned(
                right: SizeConstants.mainPagePadding,
                top: SizeConstants.mainPagePadding,
                child: Icon(
                  Icons.check_circle,
                  size: SizeConstants.maximumPadding,
                  color: ThemeConfiguration.primaryColor,
                )),
          ),
        ],
      ),
    );
  }

  _genderOthersView() {
    return InkWell(
      onTap: () {
        setState(() {
          selectedGender = 'others';
        });
        // showModalBottomSheet(
        //     isScrollControlled: true,
        //     elevation: 0.0,
        //     enableDrag: true,
        //     shape: const RoundedRectangleBorder(
        //         borderRadius: BorderRadius.only(
        //             topLeft: Radius.circular(20),
        //             topRight: Radius.circular(20))),
        //     context: context,
        //     builder: (context) {
        //       return const NonBinaryBottomSheetDialog();
        //     });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: selectedGender == 'others'
                    ? Border.all(
                        width: 1, color: ThemeConfiguration.descriptiveColor)
                    : Border.all(width: 1, color: Colors.transparent)),
            height: SizeConstants.genderContainerSize,
            width: MediaQuery.of(context).size.width / 2.8,
            alignment: Alignment.center,
            child: Image.asset(
              ImageConstants.otherIcon,
              height: SizeConstants.genderIconSize,
              width: SizeConstants.genderIconSize,
            ),
          ),
          Positioned(
              bottom: SizeConstants.mainPagePadding,
              child: Text(
                StringConstants.other,
                style: ThemeConfiguration.richText1TextStyle(),
              )),
          Visibility(
            visible: selectedGender == 'others',
            child: const Positioned(
                right: SizeConstants.mainPagePadding,
                top: SizeConstants.mainPagePadding,
                child: Icon(
                  Icons.check_circle,
                  size: SizeConstants.maximumPadding,
                  color: ThemeConfiguration.primaryColor,
                )),
          ),
        ],
      ),
    );
  }
}
