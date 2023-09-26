import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/text_styles.dart';
import 'package:dating_app/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

Widget messagesBoxWidget(
    {required String title,
    required String img,
    required BuildContext context,
    required int index}) {
  return Container(
   // height: 61,
    width: MediaQuery.of(context).size.width / 1,
    decoration: index == 0
        ? BoxDecoration(
            border: Border(
            top: BorderSide(color: Colors.black12, width: 1),
            bottom: BorderSide(color: Colors.black12, width: 1),
          ))
        : BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black12, width: 1))),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            img,
            height: 45,
            width: 45,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
                    children: [
                      TextWidgets.h5Text(text: title),
                        Text(
                    "11:30 PM",
                    style: TextsStyle.descriptionStyle()
                        .apply(color: ColorConstant.descriptiveColor,
                        
                        ),
                  ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Greate! Thank you so much',
                        style: TextsStyle.descriptionStyle()
                            .apply(color: ColorConstant.primaryColor),
                      ),
                       Container(
                      // height: 12,
                      // width: 12,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstant.primaryColor),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          '1',
                          style: TextsStyle.smallTextStyle()
                              .apply(color: ColorConstant.whiteColor),
                        ),
                      ),
                    ),
                    ],
                  )
                ],
              ),
           
            
          )
        ],
      ),
    ),
  );
}
