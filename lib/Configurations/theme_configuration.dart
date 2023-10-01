import 'package:flutter/material.dart';

class ThemeConfiguration {
  static const Color primaryColor = Color(0xffB14E92);
  static const Color commonAppBarBgColor = Color(0xffFFF5FB);
  static const Color scaffoldBgColor = Color(0xffFFF5FB);
  static const Color commonAppBarTitleColor = Color(0xff422938);
  static const Color cardBgColor = Color(0xffffffff);
  static final Color cardShadowColor = Colors.grey.shade300;
  static const Color profileContainerBgColor = Color(0xffF8E8F1);
  static const Color greyColor = Color(0xff818181);
  static const Color blackColor = Color.fromARGB(255, 10, 10, 10);
  static const Color descriptiveColor = Color(0xff89667B);
  static const Color borderColor = Color(0xffBDB9BF);
  static const Color hintTextColor = Color(0xff9D99A1);
  static const Color buttonTextColor = Color(0xffFFFFFF);
  static const Color buttonColor = Color(0xffB14E92);
  static const Color primaryLightColor = Color(0xffE485C6);
  static const Color mainChatPageBg = Color(0xffF2EDF1);
  static const Color dullTextColor = Color(0xff979797);
  static const Color border2Color = Color(0xffA08595);

  ///Font
  static const String mainFont = "Nunito";

  ///Textstyles

  static TextStyle appBarTextStyle() {
    return const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: commonAppBarTitleColor,
        fontFamily: mainFont);
  }

  static TextStyle headingTextStyle() {
    return const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: commonAppBarTitleColor,
        fontFamily: mainFont);
  }

  static TextStyle subHeadingTextStyle() {
    return const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: descriptiveColor,
        fontFamily: mainFont);
  }

  static TextStyle hintTextStyle() {
    return const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: hintTextColor,
        fontFamily: mainFont);
  }

  static TextStyle textFieldInputTextStyle() {
    return const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: descriptiveColor,
        fontFamily: mainFont);
  }

  static TextStyle buttonTextStyle() {
    return const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: buttonTextColor,
        fontFamily: mainFont);
  }

  static TextStyle richText1TextStyle() {
    return const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: descriptiveColor,
        fontFamily: mainFont);
  }

  static TextStyle richText2TextStyle() {
    return const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: primaryLightColor,
        fontFamily: mainFont);
  }

  static TextStyle showPageNumber1TextStyle() {
    return const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w900,
        color: primaryColor,
        fontFamily: mainFont);
  }

  static TextStyle showPageNumber2TextStyle() {
    return TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w900,
        color: greyColor.withOpacity(0.3),
        fontFamily: mainFont);
  }

  static TextStyle registerHeadingTextStyle() {
    return const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: commonAppBarTitleColor,
        fontFamily: mainFont);
  }

  static TextStyle profileTinyTextStyle() {
    return const TextStyle(
        color: ThemeConfiguration.primaryColor,
        fontSize: 11.0,
        overflow: TextOverflow.clip);
  }

  static TextStyle msgNameTextStyle() {
    return const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: commonAppBarTitleColor,
        fontFamily: mainFont);
  }

  static TextStyle tinnyTextStyle() {
    return const TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.w600,
        color: descriptiveColor,
        fontFamily: mainFont);
  }

  static TextStyle commonTextStyle(fontSize, fontWeight, color) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: mainFont);
  }
}
