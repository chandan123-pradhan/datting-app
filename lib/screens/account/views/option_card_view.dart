import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/constants.dart';
import 'package:flutter/material.dart';

class OptionCardView extends StatelessWidget {
  final String? heading;
  final String? image;
  final String? title;
  final Widget? widget;
  final bool? isWidgetShow;
  final bool? isShowEditIcon;
  final onEdit;

  const OptionCardView({
    super.key,
     this.heading,
    required this.image,
    required this.title,
    required this.widget,
    required this.isWidgetShow,
    this.isShowEditIcon = false,
    this.onEdit,
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
              height: 20,
              width: 20,
              color: ColorConstant.descriptiveColor,
            ),
            const SizedBox(
              width: Constant.maximumPadding,
            ),
            if (isWidgetShow == false)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    heading??'',
                    style:const  TextStyle(color: ColorConstant.blackColor,fontWeight: FontWeight.bold,fontSize: 14),
                  ),
                  const SizedBox(height: 2.0,),
                  Text(
                title ?? '',
                style: const TextStyle(color: ColorConstant.descriptiveColor,fontSize: 16),
              ),
                ],
              ),
            if (isWidgetShow == true)
              Expanded(
                child: widget!,
              ),
          ],
        ),
        Visibility(
          visible: isShowEditIcon == true,
          child: Positioned(
              right: 0,
              top: 0,
              child: InkWell(
                onTap: onEdit,
                child: Icon(Icons.edit_outlined,
                    color: ColorConstant.primaryColor, size: 15),
              )),
        )
      ],
    );
  }
}
