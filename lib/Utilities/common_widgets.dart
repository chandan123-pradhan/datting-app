import 'package:country_code_picker/country_code_picker.dart';
import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/constants.dart';
import 'package:flutter/material.dart';

class CommonWidgets {
  ///Text fields
  ///
  static Widget mobileNumberInputTextField(
      {required BuildContext context,
      required TextEditingController textFieldController}) {
    return Container(
        height: SizeConstants.buttonHeight,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(SizeConstants.textFieldCardBorderRadius),
            border: Border.all(
                width: 1,
                color: textFieldController.text == ""
                    ? ThemeConfiguration.borderColor
                    : ThemeConfiguration.descriptiveColor)),
        child: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CountryCodePicker(
                  padding:
                      const EdgeInsets.only(left: SizeConstants.mediumPadding),
                  onChanged: print,
                  initialSelection: 'IN',
                  favorite: const ['+91', 'IN'],
                  textStyle: ThemeConfiguration.textFieldInputTextStyle(),
                  showCountryOnly: false,
                  showDropDownButton: false,
                  showOnlyCountryWhenClosed: false,
                  alignLeft: false,
                  flagWidth: 20,
                ),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 20,
                  color: ColorConstant.descriptiveColor,
                )
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextFormField(
                controller: textFieldController,
                style: ThemeConfiguration.hintTextStyle(),
                keyboardType: TextInputType.number,
                cursorColor: ThemeConfiguration.descriptiveColor,
                decoration: InputDecoration(
                  isCollapsed: true,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  border: InputBorder.none,
                  filled: true,
                  hintStyle: ThemeConfiguration.hintTextStyle(),
                  hintText: StringConstants.phoneNumberHint,
                  fillColor: Colors.transparent,
                ),
              ),
            ),
          ],
        ));
  }

  // static Widget otpTextField({
  //   required int inputFieldLength,
  // }) {
  //   final defaultPinTheme = PinTheme(
  //     width: 48,
  //     height: 48,
  //     margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
  //     textStyle: TextsStyle.h1Style(),
  //     decoration: BoxDecoration(
  //         border: Border.all(color: ColorConstant.primaryColor),
  //         borderRadius: BorderRadius.circular(10),
  //         color: ColorConstant.whiteColor),
  //   );

  //   final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  //       border: Border.all(color: ColorConstant.primaryColor),
  //       borderRadius: BorderRadius.circular(10),
  //       color: ColorConstant.whiteColor);

  //   final submittedPinTheme = defaultPinTheme.copyWith(
  //     decoration:
  //         defaultPinTheme.decoration!.copyWith(color: ColorConstant.whiteColor),
  //   );

  //   return Pinput(
  //     length: inputFieldLength,
  //     defaultPinTheme: defaultPinTheme,
  //     focusedPinTheme: focusedPinTheme,
  //     submittedPinTheme: submittedPinTheme,
  //     // validator: (s) {
  //     //   return s == '1234' ? null : 'Pin is incorrect';
  //     // },
  //     pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
  //     showCursor: true,
  //     onCompleted: (pin) => print(pin),
  //   );
  // }

  static Widget inputField(
      {required BuildContext context,
      required String hintText,
      required TextInputType textInputType,
      required TextEditingController textFieldController}) {
    return Container(
      height: SizeConstants.buttonHeight,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(SizeConstants.textFieldCardBorderRadius),
          border: Border.all(width: 0.5, color: ColorConstant.borderColor)),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(
          left: SizeConstants.mainPagePadding,
          right: SizeConstants.mainPagePadding,
        ),
        child: TextFormField(
          controller: textFieldController,
          style: ThemeConfiguration.hintTextStyle(),
          keyboardType: textInputType,
          cursorColor: ThemeConfiguration.descriptiveColor,
          decoration: InputDecoration(
            isCollapsed: true,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            border: InputBorder.none,
            filled: true,
            hintStyle: ThemeConfiguration.hintTextStyle(),
            hintText: hintText,
            fillColor: Colors.transparent,
          ),
        ),
      ),
    );
  }

  static Widget bigInputField(
      {required BuildContext context,
      required String hintText,
      required TextInputType textInputType,
      required TextEditingController textFieldController}) {
    return Container(
      height: SizeConstants.aboutFieldHeight,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(SizeConstants.mainContainerContentPadding),
          border: Border.all(width: 0.5, color: ColorConstant.borderColor)),
      alignment: Alignment.center,
      child: Padding(
        padding:
            const EdgeInsets.all(SizeConstants.mainContainerContentPadding),
        child: SizedBox.expand(
          child: TextFormField(
            controller: textFieldController,
            style: ThemeConfiguration.hintTextStyle(),
            keyboardType: textInputType,
            cursorColor: ThemeConfiguration.descriptiveColor,
            maxLines: 20,
            decoration: InputDecoration(
              isCollapsed: true,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              border: InputBorder.none,
              filled: true,
              hintStyle: ThemeConfiguration.hintTextStyle(),
              hintText: hintText,
              fillColor: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }

  ///Button Widgets
  static Widget mainBotton(
      {required String title,
      required BuildContext context,
      required Function onPressed}) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
          height: Constant.mainBottonHeight,
          width: MediaQuery.of(context).size.width / 1,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(SizeConstants.textFieldCardBorderRadius),
            color: ThemeConfiguration.buttonColor,
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: ThemeConfiguration.buttonTextStyle(),
          )),
    );
  }

  static Widget backBottonWidget({required Function onTap}) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Image.asset(
        ImageConstants.backButton,
        height: SizeConstants.backButtonSize,
        width: SizeConstants.backButtonSize,
        color: ThemeConfiguration.buttonColor,
      ),
    );
  }

  ///Other widgets
  static Widget linkTextWidget(
      {required String text,
      required String linkText,
      required Function onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: ThemeConfiguration.richText1TextStyle(),
        ),
        const SizedBox(
          width: SizeConstants.smallPadding,
        ),
        InkWell(
          onTap: () {
            onTap();
          },
          child: Text(
            linkText,
            textAlign: TextAlign.center,
            style: ThemeConfiguration.richText2TextStyle(),
          ),
        ),
      ],
    );
  }

  static Widget showPageNumberWidget(
      {required String text,
      required String linkText,
      required Function onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: ThemeConfiguration.showPageNumber1TextStyle(),
        ),
        const SizedBox(
          width: SizeConstants.altraSmallPadding,
        ),
        InkWell(
          onTap: () {
            onTap();
          },
          child: Text(
            linkText,
            textAlign: TextAlign.center,
            style: ThemeConfiguration.showPageNumber2TextStyle(),
          ),
        ),
      ],
    );
  }
}
