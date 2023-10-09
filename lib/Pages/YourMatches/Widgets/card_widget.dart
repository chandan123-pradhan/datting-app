// ignore_for_file: non_constant_identifier_names

import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Pages/Messages/View/main_chat_view.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:flutter/material.dart';

Widget CardWidget(
    {required String title,
    required String img,
    required BuildContext context,
    required int index}) {
  return Container(
    width: MediaQuery.of(context).size.width / 1,
    decoration: index == 0
        ? const BoxDecoration(
            border: Border(
            bottom:
                BorderSide(color: ThemeConfiguration.borderColor, width: 0.5),
          ))
        : const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black12, width: 1))),
    child: Padding(
      padding:
          const EdgeInsets.symmetric(vertical: SizeConstants.mainPagePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            img,
            height: 52,
            width:52,
          ),
          const SizedBox(
            width: SizeConstants.mainPagePadding,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: ThemeConfiguration.msgNameTextStyle(),
                    ),
                     InkWell(
                      onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const MainChatView();
                        }));
                      },
                       child: Image.asset(
                     ImageConstants.chatIcon,
                               height: SizeConstants.msgIconHeight,
                               width: SizeConstants.msgIconHeight,
                             ),
                     ),
                  ],
                ),
            ],
            ),
          )
        ],
      ),
    ),
  );
}
