import 'package:country_code_picker/country_code_picker.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/constants.dart';
import 'package:dating_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class TextFieldWidgets {
  static Widget mobileNumberInputTextField(
      {required BuildContext context,
      required TextEditingController textFieldController}) {
    return Container(
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Constant.normalCardBorderRadius),
            border: Border.all(width: 1, color: ColorConstant.borderColor)),
        child: Row(
          children: [
            Container(
              // width: MediaQuery.of(context).size.width / 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CountryCodePicker(
                    padding: EdgeInsets.zero,
                    onChanged: print,
    
                    initialSelection: 'IN',
                    favorite: const ['+91', 'IN'],
                    //textStyle: TextsStyle.descriptionStyle(),
                    showCountryOnly: false,
                    showDropDownButton: false,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 20,
                    color: ColorConstant.descriptiveColor,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextFormField(
                controller: textFieldController,
                style: TextsStyle.descriptionStyle(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  isCollapsed: true,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  border: InputBorder.none,
                  filled: true,
                  hintStyle: TextsStyle.descriptionStyle(),
                  hintText: "Enter phone number",
                  fillColor: Colors.transparent,
                ),
              ),
            ),
          ],
        ));
  }

  static Widget otpTextField({
    required int inputFieldLength,
  }) {
    final defaultPinTheme = PinTheme(
      width: 48,
      height: 48,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      textStyle: TextsStyle.h1Style(),
      decoration: BoxDecoration(
          border: Border.all(color: ColorConstant.primaryColor),
          borderRadius: BorderRadius.circular(10),
          color: ColorConstant.whiteColor),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
        border: Border.all(color: ColorConstant.primaryColor),
        borderRadius: BorderRadius.circular(10),
        color: ColorConstant.whiteColor);

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration:
          defaultPinTheme.decoration!.copyWith(color: ColorConstant.whiteColor),
    );

    return Pinput(
      length: inputFieldLength,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      // validator: (s) {
      //   return s == '1234' ? null : 'Pin is incorrect';
      // },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    );
  }




static Widget inputField(
      {required BuildContext context,
      required String hintText,
      required TextInputType textInputType,
      required TextEditingController textFieldController}) {
    return Container(
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: ColorConstant.borderColor)),
        
        alignment: Alignment.center,
        child:  Padding(
          padding: const EdgeInsets.only(left:10,right: 10),
          child: TextFormField(
                  controller: textFieldController,
                  style: TextsStyle.descriptionStyle(),
                  keyboardType: textInputType,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    border: InputBorder.none,
                    filled: true,
                    hintStyle: TextsStyle.descriptionStyle(),
                    hintText: hintText,
                    fillColor: Colors.transparent,
                  ),
                ),
        ),
            
          
        );
  }




}
