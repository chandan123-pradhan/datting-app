import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/utils/text_styles.dart';
import 'package:flutter/material.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfiguration.scaffoldBgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemeConfiguration.scaffoldBgColor,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(
            SizeConstants.smallPadding,
            SizeConstants.smallPadding,
            0.0,
            SizeConstants.mainPagePadding,
          ),
          child: CommonWidgets.backBottonWidget(onTap: () {
            Navigator.pop(context);
          }),
        ),
        centerTitle: true,
        title: Text(
          StringConstants.wallet,
          style: ThemeConfiguration.appBarTextStyle(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: ThemeConfiguration.primaryColor.withOpacity(0.1),
                    border: Border.all(color: ThemeConfiguration.primaryColor),
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
                          const SizedBox(height: SizeConstants.smallPadding),
                          Text(
                            '432',
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
              const SizedBox(height: SizeConstants.bigPadding),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: SizeConstants.bigPadding +
                        SizeConstants.bigPadding +
                        SizeConstants.mediumPadding),
                child: Text(
                  StringConstants.walletSubtitle,
                  style: ThemeConfiguration.commonTextStyle(
                      14.0,
                      FontWeight.w500,
                      ThemeConfiguration.commonAppBarTitleColor),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: SizeConstants.bigPadding),
              Text(
                StringConstants.buyCoins,
                style: ThemeConfiguration.commonTextStyle(22.0, FontWeight.w500,
                    ThemeConfiguration.commonAppBarTitleColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SizeConstants.bigPadding),
              _coinsView(),
              const SizedBox(height: SizeConstants.bigPadding),
              Text(
                "or",
                style: ThemeConfiguration.commonTextStyle(
                    18.0, FontWeight.w500, ThemeConfiguration.primaryColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SizeConstants.bigPadding),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: ThemeConfiguration.primaryColor),
                    borderRadius: BorderRadius.circular(
                        SizeConstants.normalCardBorderRadius)),
                child: Padding(
                  padding: const EdgeInsets.all(
                      SizeConstants.mainContainerContentPadding),
                  child: Row(children: [
                    Image.asset(
                      ImageConstants.coinsIcon,
                      height: 35,
                      width: 35,
                    ),
                    const SizedBox(
                      width: SizeConstants.mediumPadding,
                    ),
                    const Expanded(
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
        ),
      ),
    );
  }

  _coinsView() {
    return Column(
      children: [
        coinCard(context: context),
        const SizedBox(
          height: SizeConstants.maximumPadding,
        ),
        coinCard(context: context),
        const SizedBox(
          height: SizeConstants.maximumPadding,
        ),
        coinCard(context: context),
      ],
    );
  }
}

class coinCard extends StatelessWidget {
  const coinCard({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConstants.buttonHeight,
      width: MediaQuery.of(context).size.width / 1,
      decoration: BoxDecoration(
          border: Border.all(color: ThemeConfiguration.borderColor),
          borderRadius: BorderRadius.circular(8.0)),
      alignment: Alignment.center,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: SizeConstants.mediumPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  ImageConstants.coinsIcon,
                  height: SizeConstants.coinSize,
                  width: SizeConstants.coinSize,
                ),
                const SizedBox(
                  width: SizeConstants.mediumPadding,
                ),
                Text("500",
                    style: ThemeConfiguration.commonTextStyle(
                        18.0,
                        FontWeight.w600,
                        ThemeConfiguration.commonAppBarTitleColor))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ThemeConfiguration.primaryColor.withOpacity(0.1),
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: SizeConstants.mainPagePadding),
                  child: Text(
                    "50 Rs",
                    style: TextsStyle.h5Style()
                        .apply(color: ThemeConfiguration.blackColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
