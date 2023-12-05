import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:flutter/material.dart';

class ReplyCardWidget extends StatelessWidget {
  String msg;
  ReplyCardWidget({required this.msg});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 1,
          height: 1,
        ),
        Container(
          // ImageConstants.myChat,
          //  height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
              )),
          width: MediaQuery.of(context).size.width / 1.2,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              msg,
              style: ThemeConfiguration.commonTextStyle(
                15.0,
                FontWeight.w500,
                ThemeConfiguration.commonAppBarTitleColor,
              ),
              overflow: TextOverflow.clip,
            ),
          ),
        ),
      ],
    );
  }
}
