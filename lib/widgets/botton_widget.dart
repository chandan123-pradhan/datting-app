import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/constants.dart';
import 'package:dating_app/utils/image_utils.dart';
import 'package:dating_app/utils/string_utils.dart';
import 'package:dating_app/utils/text_styles.dart';
import 'package:dating_app/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class BottonWidgets{
  static Widget mainBotton({required String title,required BuildContext context, required Function onPressed}){
    return InkWell(
      onTap: (){
        onPressed();
      },
      child: Container(
        height: Constant.mainBottonHeight,
        width: MediaQuery.of(context).size.width/1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorConstant.primaryColor,
          
        ),
        alignment: Alignment.center,
        child:TextWidgets.bottonsTitleWidget(text: title)
      ),
    );
  }


static Widget backBottonWidget({required Function onTap}){
  return  InkWell(
    onTap: (){
      onTap();
    },
    child: Image.asset(
                      ImageUtils.back_botton,
                      height: 45,
                      width: 45,
                    ),
  );
}


}