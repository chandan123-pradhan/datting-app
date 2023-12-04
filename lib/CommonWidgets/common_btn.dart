
import 'package:dating_app/Helper/global_data_helper.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
  
  
  Padding commonButton({required onButtonTap, required context}) {
    return Padding(
              padding: const EdgeInsets.all(SizeConstants.maximumPadding),
              child: InkWell(
                onTap: () {
onButtonTap();  },
                child: Container(
                  height: SizeConstants.buttonHeight,
                  width: MediaQuery.of(context).size.width / 1,
                  decoration: BoxDecoration(
                    color: ColorConstant.primaryColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: const Center(
                      child: Text(
                    StringConstants.submit,
                    style: TextStyle(
                        color: ColorConstant.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            );
  }
