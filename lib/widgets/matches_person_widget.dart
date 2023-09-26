import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

Widget matchesPersonWidget(
    {required String title,
    required String img,
    required BuildContext context,
    required int index
    }) {
  return Container(
    height: 61,
    width: MediaQuery.of(context).size.width / 1,
    decoration: 
    
    index==0? BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black12, width: 1),
        bottom: BorderSide(color: Colors.black12, width: 1),
        
        
        )):
    BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12, width: 1))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              img,
              height: 45,
              width: 45,
            ),
            SizedBox(
              width: 20,
            ),
            TextWidgets.h5Text(text: title)
          ],
        ),
        Image.asset(
          'assets/icons/message_icon.png',
          height: 24,
          width: 24,
        ),
      ],
    ),
  );
}
