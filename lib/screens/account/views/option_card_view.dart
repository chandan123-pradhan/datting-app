import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/constants.dart';
import 'package:flutter/material.dart';

class OptionCardView extends StatelessWidget {
  final String? image;
  final String? title;
  final Widget? widget;
  final bool? isWidgetShow;
  final bool? isShowEditIcon;

  const OptionCardView({
    super.key,
    required this.image,
    required this.title,
    required this.widget,
    required this.isWidgetShow,
     this.isShowEditIcon=false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image ?? '',
              height: 25,
              width: 25,
              color: ColorConstant.descriptiveColor,
            ),
            const SizedBox(
              width: Constant.maximumPadding,
            ),
            if (isWidgetShow == false)
              Text(
                title ?? '',
                style: const TextStyle(color: ColorConstant.descriptiveColor),
              ),
            if (isWidgetShow == true)
              Expanded(
                child: widget!,
              ),
          ],
        ),
    Visibility(
      visible: isShowEditIcon==true,
      child: const Positioned(
        right: 0,
        top: 0,
        child: 
       
      Icon(Icons.edit_outlined,color: ColorConstant.primaryColor,size:15)),
    )  ],
    );
  }
}
