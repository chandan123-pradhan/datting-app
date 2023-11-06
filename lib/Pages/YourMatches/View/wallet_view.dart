import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Pages/Login/Widgets/login_bottom_widget.dart';
import 'package:dating_app/Pages/YourMatches/Bloc/wallet_bloc.dart';
import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/Utilities/dialogs.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  var walletController = Get.put(WalletController());
  TextEditingController coinsController = TextEditingController();
  @override
  void initState() {
    walletController.getWalletApiResponse();
    // TODO: implement initState
    super.initState();
  }

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
      body: GetBuilder<WalletController>(
          init: WalletController(),
          builder: (controller) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
                child: controller.getWalletDetailsApiResponse == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: ThemeConfiguration.primaryColor
                                      .withOpacity(0.1),
                                  border: Border.all(
                                      color: ThemeConfiguration.primaryColor),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          StringConstants.availableCoins,
                                          style: ThemeConfiguration
                                              .commonTextStyle(
                                                  14.0,
                                                  FontWeight.w500,
                                                  ThemeConfiguration
                                                      .descriptiveColor),
                                        ),
                                        const SizedBox(
                                            height: SizeConstants.smallPadding),
                                        Text(
                                          '${controller.getWalletDetailsApiResponse!.data.walletBalance}',
                                          style: ThemeConfiguration
                                              .commonTextStyle(
                                                  22.0,
                                                  FontWeight.w500,
                                                  ThemeConfiguration
                                                      .commonAppBarTitleColor),
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
                              style: ThemeConfiguration.commonTextStyle(
                                  22.0,
                                  FontWeight.w500,
                                  ThemeConfiguration.commonAppBarTitleColor),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: SizeConstants.bigPadding),
                            _coinsView(),
                            const SizedBox(height: SizeConstants.bigPadding),
                            Text(
                              "or",
                              style: ThemeConfiguration.commonTextStyle(
                                  18.0,
                                  FontWeight.w500,
                                  ThemeConfiguration.primaryColor),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: SizeConstants.bigPadding),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ThemeConfiguration.primaryColor),
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
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          StringConstants.getFreeCoins,
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                              color: ThemeConfiguration
                                                  .blackColor),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          StringConstants.getFreeCoinsSubTitle,
                                          style: TextStyle(
                                            color:
                                                ThemeConfiguration.primaryColor,
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
          }),
      bottomNavigationBar: BottomAppBar(
        color: ThemeConfiguration.scaffoldBgColor,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: InkWell(
            onTap: () async{
              coinsController.clear();
              Dialogs.addCoinsDeductionDialog(
                context,
                coinsController,
                () {
                  //  walletController.callAddMoneyToWallet(
                  //   coinsController.text,
                  //   context
                  // );
                  walletController.orderWithRazorpay(coinsController.text,context,true);
                 
                },
               
              );
            },
            child: Image.asset(
              ImageConstants.addCoinsBtn,
              height: SizeConstants.buttonHeight,
              width: MediaQuery.of(context).size.width / 1,
            ),
          ),
        ),
      ),
    );
  }

  _coinsView() {
    return Column(
      children: [
        coinCard(context: context,price: '100', coins: '100',),
        const SizedBox(
          height: SizeConstants.maximumPadding,
        ),
        coinCard(context: context,
        coins:'200',price: '200',),
        const SizedBox(
          height: SizeConstants.maximumPadding,
        ),
        coinCard(context: context,
        coins: '500',
          price: '500',
        ),
      ],
    );
  }
}

class coinCard extends StatefulWidget {
  final String coins;
  final String price;
  const coinCard({
    super.key,
    required this.context,
    required this.coins,
    required this.price
  });

  final BuildContext context;

  @override
  State<coinCard> createState() => _coinCardState();
}

class _coinCardState extends State<coinCard> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
        init: WalletController(),
        builder: (controller) {
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
                    Text("${widget.coins}",
                        style: ThemeConfiguration.commonTextStyle(
                            18.0,
                            FontWeight.w600,
                            ThemeConfiguration.commonAppBarTitleColor))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: InkWell(
                    onTap: (){
                      controller.orderWithRazorpay(widget.price,context,false);

                    },
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
                          "${widget.price} Rs",
                          style: TextsStyle.h5Style()
                              .apply(color: ThemeConfiguration.blackColor),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
