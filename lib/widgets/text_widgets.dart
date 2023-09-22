import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/text_styles.dart';
import 'package:flutter/material.dart';

class TextWidgets {
  static Widget h1Tag({required String text}) {
    return SizedBox(
      height: 28,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextsStyle.h1Style(),
      ),
    );
  }

  static Widget h2Tag({required String text}) {
    return SizedBox(
      height: 30,
      child:
          Text(text, textAlign: TextAlign.center, style: TextsStyle.h4Style()),
    );
  }

  static Widget descriptiveTag({required String text}) {
    return SizedBox(
      //height: 24,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextsStyle.descriptionStyle(),
      ),
    );
  }

  static Widget h5Text({required String text}) {
    return SizedBox(
      //height: 24,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextsStyle.h5Style(),
      ),
    );
  }

  static Widget stepTextTag({required String text}) {
    return SizedBox(
      //height: 24,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextsStyle.stepTextStyle(),
      ),
    );
  }

  static Widget bottonsTitleWidget({required String text}) {
    return SizedBox(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextsStyle.h3Style(),
      ),
    );
  }

   static Widget blackTextTitle({required String text}) {
    return SizedBox(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextsStyle.titleTextStyle().apply(color: ColorConstant.primaryColor,)
      ),
    );
  }

  static Widget linkTextWidget(
      {required String text,
      required String linkText,
      required Function onTap}) {
    return SizedBox(
      height: 28,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextsStyle.h2Style().apply(
              color: ColorConstant.blackColor,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () {
              onTap();
            },
            child: Text(
              linkText,
              textAlign: TextAlign.center,
              style: TextsStyle.h2Style().apply(color: ColorConstant.linkColor),
            ),
          ),
        ],
      ),
    );
  }
}
