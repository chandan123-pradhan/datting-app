import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/constants.dart';
import 'package:dating_app/utils/image_utils.dart';
import 'package:dating_app/utils/string_utils.dart';
import 'package:flutter/material.dart';

class ProfileCardView extends StatelessWidget {
  const ProfileCardView({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: Constant.profileAvatarRadius,
              backgroundColor: ColorConstant.cardShadowColor,
            ),
            const Positioned(
                right: 0.0,
                bottom: 5.0,
                child: CircleAvatar(
                  radius: Constant.profileAvatarEditRadius,
                  backgroundImage: AssetImage(ImageUtils.profilePicEditButton),
                ))
          ],
        ),
        const SizedBox(
          height: Constant.maximumPadding,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Profile Name',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: Constant.smallPadding,
              ),
              Image.asset(
                ImageUtils.shieldTickButton,
                height: 22,
                width: 22,
              ),
            ],
          ),
        ),
                          const SizedBox(
                    height: Constant.maximumPadding,
                  ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: deviceSize.width / 2.3,
              decoration: BoxDecoration(
                color: ColorConstant.cardBgColor,
                borderRadius:
                    BorderRadius.circular(Constant.normalCardBorderRadius),
                boxShadow: [
                  BoxShadow(
                    color: ColorConstant.cardShadowColor,
                    blurRadius: Constant.normalCardBorderRadius,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(Constant.mainContainerContentPadding),
                child: Row(children: [
                  Image.asset(
                    ImageUtils.walletIcon,
                    height: 50,
                    width: 50,
                    color: ColorConstant.primaryColor,
                  ),
                  const SizedBox(
                    width: Constant.mediumPadding,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const[
                        Text(
                          StringUtils.yourWallet,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: ColorConstant.blackColor),
                        ),
                         SizedBox(
                          height: 5.0,
                        ),
                         Text(
                          "${StringUtils.yourWalletSubTitleOne}320 ${StringUtils.yourWalletSubTitleTwo}",
                          style: TextStyle(
                            color: ColorConstant.primaryColor,
                            fontSize: 11.0,
                            overflow: TextOverflow.clip
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
            const SizedBox(height: Constant.maximumPadding),
                    Container(
              width: deviceSize.width / 2.2,
              decoration: BoxDecoration(
                color: ColorConstant.cardBgColor,
                borderRadius:
                    BorderRadius.circular(Constant.normalCardBorderRadius),
                boxShadow: [
                  BoxShadow(
                    color: ColorConstant.cardShadowColor,
                    blurRadius: Constant.normalCardBorderRadius,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(Constant.mainContainerContentPadding),
                child: Row(children: [
                  Image.asset(
                    ImageUtils.playCircle,
                    height: 40,
                    width: 40,
                    color: ColorConstant.primaryColor,
                  ),
                  const SizedBox(
                    width: Constant.mediumPadding,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:const [
                        Text(
                          StringUtils.getFreeCoins,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: ColorConstant.blackColor),
                        ),
                         SizedBox(
                          height: 5.0,
                        ),
                         Text(
                          StringUtils.getFreeCoinsSubTitle ,
                          style: TextStyle(
                            color: ColorConstant.primaryColor,
                            fontSize: 11.0,
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
           ],
        ),
      ],
    );
  }
}
