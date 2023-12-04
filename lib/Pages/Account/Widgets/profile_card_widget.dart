import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Models/userdata_model.dart';
import 'package:dating_app/Pages/YourMatches/Bloc/wallet_bloc.dart';
import 'package:dating_app/Pages/YourMatches/View/wallet_view.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileCardWidget extends StatefulWidget {
  final UserDataModel? userDataModel;
  const ProfileCardWidget({super.key, required this.userDataModel});

  @override
  State<ProfileCardWidget> createState() => _ProfileCardWidgetState();
}

class _ProfileCardWidgetState extends State<ProfileCardWidget> {
  var walletController = Get.put(WalletController());
  @override
  void initState() {
    walletController.getWalletApiResponse();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            // CircleAvatar(
            //   radius: SizeConstants.profileAvatarRadius,
            //   backgroundColor: ThemeConfiguration.cardShadowColor,
            //   backgroundImage: NetworkImage(
            //       (widget.userDataModel?.imageUrl ?? '') +
            //           (widget.userDataModel?.data?.image ?? '')),
            // ),
            CircleAvatar(
              radius: SizeConstants.profileAvatarRadius,
              backgroundColor: ThemeConfiguration.cardShadowColor,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl:(widget.userDataModel?.imageUrl ?? '') +
                      (widget.userDataModel?.data?.image ?? ''),
                  placeholder: (context, url) => Image.asset(ImageConstants.accountIcon,height: 40,color: ColorConstant.primaryColor,),
                  errorWidget: (context, url, error) => Image.asset(ImageConstants.accountIcon,height: 40,color: ColorConstant.primaryColor,),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned.fill(
              child: CircularProgressIndicator(
                value: 0.8, // Provide the completion percentage here,
                strokeWidth: 5,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  ThemeConfiguration.primaryColor,
                ),
                backgroundColor: ThemeConfiguration.greyColor.withOpacity(
                    0.5), // Background color of the progress indicator
              ),
            ),
            // const Positioned(
            //             right: 0.0,
            //             bottom: 5.0,
            //             child: CircleAvatar(
            //               radius: SizeConstants.profileAvatarEditRadius,
            //               backgroundImage:
            //                   AssetImage(ImageConstants.profilePicEditButton),
            //             )),
          ],
        ),
        const SizedBox(
          height: SizeConstants.maximumPadding,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.userDataModel?.data?.fullName ?? '',
                  style: ThemeConfiguration.textFieldInputTextStyle()
                      ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
              Text(' ( 26 )',
                  style: ThemeConfiguration.textFieldInputTextStyle()
                      ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500)),
              //  if (widget.userDataModel?.data?.approved == true)
              const SizedBox(
                width: SizeConstants.smallPadding,
              ),
              // if (widget.userDataModel?.data?.approved == true)
              Image.asset(
                ImageConstants.shieldTickButton,
                height: 25,
                width: 25,
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
            GetBuilder<WalletController>(
                init: WalletController(),
                builder: (controller) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const WalletView();
                      }));
                    },
                    child: Container(
                      width: deviceSize.width / 2.3,
                      decoration: BoxDecoration(
                        color: ThemeConfiguration.cardBgColor,
                        borderRadius: BorderRadius.circular(
                            SizeConstants.normalCardBorderRadius),
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
                                controller.getWalletDetailsApiResponse == null
                                    ? Text(
                                        "${StringConstants.yourWalletSubTitleOne} ${StringConstants.yourWalletSubTitleTwo}",
                                        style: ThemeConfiguration
                                            .profileTinyTextStyle(),
                                        maxLines: 2,
                                      )
                                    : Text(
                                        "${StringConstants.yourWalletSubTitleOne}${controller.getWalletDetailsApiResponse!.data.walletBalance} ${StringConstants.yourWalletSubTitleTwo}",
                                        style: ThemeConfiguration
                                            .profileTinyTextStyle(),
                                        maxLines: 2,
                                      ),
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                  );
                }),
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
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          StringConstants.getFreeCoinsSubTitle,
                          style: ThemeConfiguration.profileTinyTextStyle(),
                          maxLines: 2,
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
            String referralCode =
                widget.userDataModel?.data?.userReferralCode ?? '';
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
