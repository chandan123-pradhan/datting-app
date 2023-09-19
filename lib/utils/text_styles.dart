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


   static TextStyle descriptionStyle(){
    return const TextStyle(
      color: ColorConstant.descriptiveColor,
      fontSize: Constant.descriptiveTextSize ,
      fontWeight: FontWeight.w500,

    );
  }
}