import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Models/userdata_model.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ProfileCardWidget extends StatelessWidget {
  final UserDataModel? userDataModel;
  const ProfileCardWidget({super.key, required this.userDataModel});

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: SizeConstants.profileAvatarRadius,
              backgroundColor: ThemeConfiguration.cardShadowColor,
              backgroundImage: NetworkImage(userDataModel?.data?.image ?? ''),
            ),
            const Positioned(
                right: 0.0,
                bottom: 5.0,
                child: CircleAvatar(
                  radius: SizeConstants.profileAvatarEditRadius,
                  backgroundImage:
                      AssetImage(ImageConstants.profilePicEditButton),
                ))
          ],
        ),
        const SizedBox(
          height: SizeConstants.maximumPadding,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(userDataModel?.data?.fullName ?? '',
                  style: ThemeConfiguration.textFieldInputTextStyle()),
              if (userDataModel?.data?.approved == true)
                const SizedBox(
                  width: SizeConstants.smallPadding,
                ),
              if (userDataModel?.data?.approved == true)
                Image.asset(
                  ImageConstants.shieldTickButton,
                  height: 18,
                  width: 18,
                ),
            ],
          ),
        ),
        const SizedBox(
          height: SizeConstants.maximumPadding,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: deviceSize.width / 2.3,
              decoration: BoxDecoration(
                color: ThemeConfiguration.cardBgColor,
                borderRadius:
                    BorderRadius.circular(SizeConstants.normalCardBorderRadius),
                boxShadow: [
                  BoxShadow(
                    color: ThemeConfiguration.cardShadowColor,
                    blurRadius: SizeConstants.normalCardBorderRadius,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                    SizeConstants.mainContainerContentPadding),
                child: Row(children: [
                  Image.asset(
                    ImageConstants.walletIcon,
                    height: 40,
                    width: 40,
                    color: ThemeConfiguration.primaryColor,
                  ),
                  const SizedBox(
                    width: SizeConstants.mediumPadding,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          StringConstants.yourWallet,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "${StringConstants.yourWalletSubTitleOne}320 ${StringConstants.yourWalletSubTitleTwo}",
                          style: ThemeConfiguration.profileTinyTextStyle(),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
            const SizedBox(height: SizeConstants.maximumPadding),
            Container(
              width: deviceSize.width / 2.2,
              decoration: BoxDecoration(
                color: ThemeConfiguration.cardBgColor,
                borderRadius:
                    BorderRadius.circular(SizeConstants.normalCardBorderRadius),
                boxShadow: [
                  BoxShadow(
                    color: ThemeConfiguration.cardShadowColor,
                    blurRadius: SizeConstants.normalCardBorderRadius,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                    SizeConstants.mainContainerContentPadding),
                child: Row(children: [
                  Image.asset(
                    ImageConstants.playCircle,
                    height: 35,
                    width: 35,
                    color: ThemeConfiguration.primaryColor,
                  ),
                  const SizedBox(
                    width: SizeConstants.mediumPadding,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringConstants.getFreeCoins,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: ThemeConfiguration.blackColor),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          StringConstants.getFreeCoinsSubTitle,
                          style: TextStyle(
                            color: ThemeConfiguration.primaryColor,
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
        const SizedBox(
          height: SizeConstants.maximumPadding,
        ),
        InkWell(
          onTap: () {
            String referralCode = userDataModel?.data?.userReferralCode ?? '';
            if (referralCode.isNotEmpty) {
              String message = 'My referral code: $referralCode';

              // Use the share plugin to share the referral code
              Share.share(message);
            }
          },
          child: Container(
            width: deviceSize.width / 1,
            decoration: BoxDecoration(
              color: ThemeConfiguration.cardBgColor,
              borderRadius:
                  BorderRadius.circular(SizeConstants.normalCardBorderRadius),
              boxShadow: [
                BoxShadow(
                  color: ThemeConfiguration.cardShadowColor,
                  blurRadius: SizeConstants.normalCardBorderRadius,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                  SizeConstants.mainContainerContentPadding),
              child: Row(children: [
                Image.asset(
                  ImageConstants.refferalCode,
                  height: 40,
                  width: 40,
                ),
                const SizedBox(
                  width: SizeConstants.mediumPadding,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        StringConstants.shareReferralCodeTitle,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        StringConstants.shareReferralCodeSubTitle,
                        style: ThemeConfiguration.profileTinyTextStyle(),
                        maxLines: 2,
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
