import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/image_utils.dart';
import 'package:flutter/material.dart';

Widget bottomBarItemWidget({required bool isSelected,required String img}){
    return    Container(
                        height: 60,
                        decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            color: 
                            
                            isSelected==true?
                            ColorConstant.primaryColor:Colors.transparent
                            
                            
                            ),
                        child: 
                        isSelected==true?Image.asset(
                          img,
                          height: 40,
                          width: 40,
                          color:  ColorConstant.whiteColor,
                        ):
                        
                        Image.asset(
                        img,
                          height: 40,
                          width: 40,
                          
                        ),
                      );
}