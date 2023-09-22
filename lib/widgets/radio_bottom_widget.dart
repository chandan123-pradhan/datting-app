import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/string_utils.dart';
import 'package:dating_app/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

Widget RadioBottomWidget({required bool status, required String title, required BuildContext context}){
  return Container(
  height: 39,
  width: MediaQuery.of(context).size.width/1.12,
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextWidgets.h5Text(text: title),
      status==true?
       const Icon(Icons.circle,size:20,color: ColorConstant.blackColor,):
      
      const  Icon(Icons.circle_outlined,size:20,color: ColorConstant.blackColor,)
    ],
  ),
);
}