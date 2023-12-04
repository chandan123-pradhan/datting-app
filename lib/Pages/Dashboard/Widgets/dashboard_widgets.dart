import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/image_utils.dart';
import 'package:flutter/material.dart';

Widget bottomBarItemWidget(
    {required int index, required bool isSelected, required String img}) {
  return Container(
    height: 60,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected == true
            ? ColorConstant.primaryColor
            : Colors.transparent),
    child: isSelected == true
        ? Padding(
            padding: index == 3 || index == 1
                ? const EdgeInsets.all(8.0)
                : const EdgeInsets.all(0.0),
            child: Image.asset(
              img,
              height: index == 3 || index == 1 ? 25 : 40,
              width: index == 3 || index == 1 ? 25 : 40,
              color: ColorConstant.whiteColor,
            ),
          )
        : Image.asset(
            img,
            height: index == 3 || index == 1 ? 25 : 40,
            width: index == 3 || index == 1 ? 25 : 40,
            color: ColorConstant.primaryColor,
          ),
  );
}
