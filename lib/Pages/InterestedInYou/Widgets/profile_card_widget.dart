import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Pages/ProfileDetail/View/profile_detail_view.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:flutter/material.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const ProfileDetail();
        }));
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(SizeConstants.normalCardBorderRadius),
                image: const DecorationImage(
                  image: AssetImage(
                    ImageConstants.girlDummy,
                  ),
                  fit: BoxFit.fill,
                )),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(SizeConstants.normalCardBorderRadius),
                child: Image.asset(
                  ImageConstants.profileCardBg,
                  fit: BoxFit.fill,
                )),
          ),
          Padding(
              padding: const EdgeInsets.all(
                  SizeConstants.mainContainerContentPadding),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Jenny Cruz, 28',
                  style: ThemeConfiguration.commonTextStyle(
                    13.0,
                    FontWeight.w700,
                    ThemeConfiguration.commonAppBarBgColor,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
