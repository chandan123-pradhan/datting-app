// ignore_for_file: non_constant_identifier_names

import 'package:dating_app/Configurations/theme_configuration.dart';
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
            height: SizeConstants.backButtonSize,
            width: SizeConstants.backButtonSize,
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
                    Text(
                      "11:30 PM",
                      style: ThemeConfiguration.tinnyTextStyle(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Greate! Thank you so much',
                      style: ThemeConfiguration.commonTextStyle(
                        12.0,
                        FontWeight.w600,
                        ThemeConfiguration.primaryColor,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ThemeConfiguration.primaryColor),
                      child: Padding(
                        padding:
                            const EdgeInsets.all(SizeConstants.smallPadding),
                        child: Text(
                          '1',
                          style: ThemeConfiguration.commonTextStyle(
                            8.0,
                            FontWeight.w600,
                            ThemeConfiguration.buttonTextColor,
                          ),
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
