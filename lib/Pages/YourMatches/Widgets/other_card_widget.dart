import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:flutter/material.dart';

class OtherCardWidget extends StatelessWidget {
  const OtherCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            Image.asset(
              ImageConstants.otherChat,
              width: MediaQuery.of(context).size.width / 1.2,
            ),
            Positioned(
                bottom: SizeConstants.mediumPadding,
                right: SizeConstants.mediumPadding,
                child: Text(
                  "3:02 pm",
                  style: ThemeConfiguration.commonTextStyle(
                    10.0,
                    FontWeight.w400,
                    ThemeConfiguration.dullTextColor,
                  ),
                )),
            Positioned(
                top: SizeConstants.mediumPadding,
                left: SizeConstants.mainContainerContentPadding +
                    SizeConstants.mediumPadding,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Text(
                    "Lorem ipsum dolor sit amet. Et excepturi numq.  sit amet. Et excepturi numquam.",
                    style: ThemeConfiguration.commonTextStyle(
                      12.0,
                      FontWeight.w400,
                      ThemeConfiguration.commonAppBarTitleColor,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ))
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
