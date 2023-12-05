import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:flutter/material.dart';

class OtherCardWidget extends StatelessWidget {
  String msg;
   OtherCardWidget({
    required this.msg
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            Container(
          // ImageConstants.myChat,
          //  height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
              )),
          width: MediaQuery.of(context).size.width / 1.2,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:


Text(
                    msg,
                    style: ThemeConfiguration.commonTextStyle(
                      12.0,
                      FontWeight.w400,
                      ThemeConfiguration.commonAppBarTitleColor,
                    ),
                    overflow: TextOverflow.clip,
                  ),


          )),
            Positioned(
                bottom: SizeConstants.mediumPadding,
                right: SizeConstants.mediumPadding,
                child: Text(
                  "",
                  style: ThemeConfiguration.commonTextStyle(
                    10.0,
                    FontWeight.w400,
                    ThemeConfiguration.dullTextColor,
                  ),
                )),
          
          ],
        ),
        const SizedBox(
          width: 1,
          height: 1,
        ),
      ],
    );
  }
}
