import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/constants.dart';
import 'package:flutter/material.dart';

class TextsStyle{
  static TextStyle h1Style(){
    return const TextStyle(
      color: ColorConstant.blackColor,
      fontSize: Constant.h1Size,
      fontWeight: FontWeight.w700,

    );
  }

static TextStyle h2Style(){
    return const TextStyle(
      color: ColorConstant.whiteColor,
      fontSize: Constant.h2Size ,
      fontWeight: FontWeight.w600,

    );
}

static TextStyle h4Style(){
    return const TextStyle(
      color: ColorConstant.blackColor,
      fontSize: Constant.fontSize24 ,
      fontWeight: FontWeight.w700,

    );
}

static TextStyle h3Style(){
    return const TextStyle(
      color: ColorConstant.whiteColor,
      fontSize: Constant.descriptiveTextSize ,
      fontWeight: FontWeight.w600,

    );
}

static TextStyle titleTextStyle(){
    return const TextStyle(
      color: ColorConstant.whiteColor,
      fontSize: Constant.constant16 ,
      fontWeight: FontWeight.w600,

    );
}


   static TextStyle descriptionStyle(){
    return const TextStyle(
      color: ColorConstant.descriptiveColor,
      fontSize: Constant.descriptiveTextSize ,
      fontWeight: FontWeight.w400,

    );
  }

  static TextStyle smallTextStyle(){
    return const TextStyle(
      color: ColorConstant.descriptiveColor,
      fontSize: 12 ,
      fontWeight: FontWeight.w400,

    );
  }
   static TextStyle h5Style(){
    return const TextStyle(
      color: ColorConstant.blackColor,
      fontSize: Constant.constant18 ,
      fontWeight: FontWeight.w400,

    );
  }
  static TextStyle h5boldStyle(){
    return const TextStyle(
      color: ColorConstant.blackColor,
      fontSize: Constant.constant18 ,
      fontWeight: FontWeight.w600,

    );
  }

     static TextStyle stepTextStyle(){
    return  TextStyle(
      color: ColorConstant.stepTextColor,
      fontSize: 35,
      fontWeight: FontWeight.w400,

    );
  }
}


class TextStyles{
  static TextStyle commonAppbarTitleStyle(){
    return TextStyle(
fontWeight: FontWeight.w700,
fontSize: Constant.customAppBarTitleSize,
    );
  }
}