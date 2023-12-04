import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Pages/YourMatches/Bloc/wallet_bloc.dart';
import 'package:dating_app/Pages/YourMatches/View/wallet_view.dart';
import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class Dialogs {
  static void insufficientBalanceDialog(BuildContext context,String availableCoins,String entryfee, Function onPressed) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AlertDialog(
                scrollable: true,
                content: Center(
                    child: Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: ThemeConfiguration.primaryColor.withOpacity(0.1),
                        border:
                            Border.all(color: ThemeConfiguration.primaryColor),
                        borderRadius: BorderRadius.circular(
                            SizeConstants.normalCardBorderRadius)),
                    child: Padding(
                      padding: const EdgeInsets.all(
                          SizeConstants.mainContainerContentPadding),
                      child: Row(children: [
                        Image.asset(
                          ImageConstants.walletIcon,
                          height: SizeConstants.walletIconSize,
                          width: SizeConstants.walletIconSize,
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
                                StringConstants.availableCoins,
                                style: ThemeConfiguration.commonTextStyle(
                                    14.0,
                                    FontWeight.w500,
                                    ThemeConfiguration.descriptiveColor),
                              ),
                              const SizedBox(
                                  height: SizeConstants.smallPadding),
                              Text(
                                availableCoins,
                                style: ThemeConfiguration.commonTextStyle(
                                    22.0,
                                    FontWeight.w500,
                                    ThemeConfiguration.commonAppBarTitleColor),
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                  ),
                  const SizedBox(height: SizeConstants.maximumPadding),
                  Text(
                    StringConstants.insufficientBalance,
                    style: ThemeConfiguration.commonTextStyle(
                        24.0,
                        FontWeight.w600,
                        ThemeConfiguration.commonAppBarTitleColor),
                  ),
                  const SizedBox(height: SizeConstants.mediumPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringConstants.needCoins1,
                        style: ThemeConfiguration.commonTextStyle(18.0,
                            FontWeight.w500, ThemeConfiguration.primaryColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        (double.parse(entryfee)-double.parse(availableCoins)).toStringAsFixed(0)  ,
                        style: ThemeConfiguration.commonTextStyle(18.0,
                            FontWeight.w500, ThemeConfiguration.primaryColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        StringConstants.needCoins2,
                        style: ThemeConfiguration.commonTextStyle(18.0,
                            FontWeight.w500, ThemeConfiguration.primaryColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringConstants.approach,
                        style: ThemeConfiguration.commonTextStyle(18.0,
                            FontWeight.w500, ThemeConfiguration.primaryColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(width: SizeConstants.smallPadding),
                      Text(
                        'Jenny',
                        style: ThemeConfiguration.commonTextStyle(
                            18.0,
                            FontWeight.w500,
                            ThemeConfiguration.descriptiveColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SizeConstants.maximumPadding,
                  ),
                  InkWell(
                    onTap: () {
                      onPressed();
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return const MainChatView();
                      // }));

                    //  Dialogs.insufficientBalanceDialog(context);
                    },
                    child: Image.asset(
                      ImageConstants.addCoinsBtn,
                      height: SizeConstants.buttonHeight,
                      width: MediaQuery.of(context).size.width / 1,
                    ),
                  ),
                  const SizedBox(
                    height: SizeConstants.maximumPadding,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: ThemeConfiguration.primaryColor),
                        borderRadius: BorderRadius.circular(
                            SizeConstants.normalCardBorderRadius)),
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
                            children: const [
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
                ])),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  static void coinsDeductionDialog(BuildContext context,availableCoins,entryFee,Function onPressed) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AlertDialog(
                scrollable: true,
                content: Center(
                    child: Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: ThemeConfiguration.primaryColor.withOpacity(0.1),
                        border:
                            Border.all(color: ThemeConfiguration.primaryColor),
                        borderRadius: BorderRadius.circular(
                            SizeConstants.normalCardBorderRadius)),
                    child: Padding(
                      padding: const EdgeInsets.all(
                          SizeConstants.mainContainerContentPadding),
                      child: Row(children: [
                        Image.asset(
                          ImageConstants.walletIcon,
                          height: SizeConstants.walletIconSize,
                          width: SizeConstants.walletIconSize,
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
                                StringConstants.availableCoins,
                                style: ThemeConfiguration.commonTextStyle(
                                    14.0,
                                    FontWeight.w500,
                                    ThemeConfiguration.descriptiveColor),
                              ),
                              const SizedBox(
                                  height: SizeConstants.smallPadding),
                              Row(
                                children: [
                                  Image.asset(
                                    ImageConstants.coinsIcon,
                                    height: SizeConstants.coinSize,
                                    width: SizeConstants.coinSize,
                                  ),
                                  const SizedBox(
                                    width: SizeConstants.smallPadding,
                                  ),
                                  Text(
                                    availableCoins,
                                    style: ThemeConfiguration.commonTextStyle(
                                        20.0,
                                        FontWeight.w500,
                                        ThemeConfiguration
                                            .commonAppBarTitleColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                  ),
                  const SizedBox(height: SizeConstants.maximumPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageConstants.coinsIcon,
                        height:
                            SizeConstants.coinSize + SizeConstants.smallPadding,
                        width:
                            SizeConstants.coinSize + SizeConstants.smallPadding,
                      ),
                      const SizedBox(
                        width: SizeConstants.smallPadding,
                      ),
                      Text(
                        entryFee,
                        style: ThemeConfiguration.commonTextStyle(25.0,
                            FontWeight.w900, ThemeConfiguration.primaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: SizeConstants.mediumPadding),
                  Text(
                    '${StringConstants.coinsDeduct}Jenny',
                    style: ThemeConfiguration.commonTextStyle(18.0,
                        FontWeight.w500, ThemeConfiguration.descriptiveColor),
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: SizeConstants.maximumPadding,
                  ),
                  InkWell(
                    onTap: () {
onPressed();
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return const WalletView();
                      // }));
                    },
                    child: Image.asset(
                      ImageConstants.approachBtn,
                      height: SizeConstants.buttonHeight,
                      width: MediaQuery.of(context).size.width / 1,
                    ),
                  ),
                  const SizedBox(
                    height: SizeConstants.maximumPadding,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: ThemeConfiguration.primaryColor),
                        borderRadius: BorderRadius.circular(
                            SizeConstants.normalCardBorderRadius)),
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
                ])),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  static void addCoinsDeductionDialog(BuildContext context,
      TextEditingController tcontroller, onBottonPressed) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return GetBuilder<WalletController>(
            init: WalletController(),
            builder: (controller) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AlertDialog(
                      scrollable: true,
                      content: Center(
                          child: Column(children: [
                        CommonWidgets.inputField(
                            hintText: 'Enter Coins',
                            textInputType: TextInputType.number,
                            context: context,
                            textFieldController: tcontroller),
                        const SizedBox(
                          height: SizeConstants.maximumPadding,
                        ),
                        Text(
                          '${StringConstants.addCoinDes}',
                          style: ThemeConfiguration.commonTextStyle(
                              18.0,
                              FontWeight.w500,
                              ThemeConfiguration.descriptiveColor),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: SizeConstants.maximumPadding,
                        ),
                        controller.isloading
                            ?  Container(
                                width: MediaQuery.of(context).size.width / 1,
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: ColorConstant.primaryColor,
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  onBottonPressed();
                                },
                                child: Image.asset(
                                  ImageConstants.addCoinsBtn,
                                  height: SizeConstants.buttonHeight,
                                  width: MediaQuery.of(context).size.width / 1,
                                ),
                              ),
                      ])),
                    ),
                  ],
                ),
              );
            });
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  static void showinfodialog(BuildContext context,Function onPressed) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AlertDialog(
                scrollable: true,
                content: Center(
                    child: Column(children: [
                  Text(
                    'You have to verify your face first!',
                    style: ThemeConfiguration.commonTextStyle(18.0,
                        FontWeight.w500, ThemeConfiguration.descriptiveColor),
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                 CommonWidgets.mainBotton(
                        title: 'OK', context: context, onPressed: () {
onPressed();
                        }),
                  
                  const SizedBox(
                    height: SizeConstants.maximumPadding,
                  ),
                ])),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}
