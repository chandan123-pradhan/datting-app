import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Helper/navigation_helper.dart';
import 'package:dating_app/Pages/Messages/Widgets/other_card_widget.dart';
import 'package:dating_app/Pages/Messages/Widgets/reply_card_widget.dart';
import 'package:dating_app/Pages/ProfileDetail/View/profile_detail_view.dart';
import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:flutter/material.dart';

class MainChatView extends StatefulWidget {
  const MainChatView({super.key});

  @override
  State<MainChatView> createState() => _MainChatViewState();
}

class _MainChatViewState extends State<MainChatView> {
  TextEditingController controller = TextEditingController();
  int? _value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfiguration.mainChatPageBg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemeConfiguration.primaryColor,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, NavigationHelper.profileDetail);
              },
              child: Image.asset(
                "assets/icons/person_icon.png",
                height: SizeConstants.backButtonSize,
                width: SizeConstants.backButtonSize,
              ),
            ),
            const SizedBox(
              width: SizeConstants.mainPagePadding,
            ),
            Text(
              'Profile Name',
              style: ThemeConfiguration.buttonTextStyle(),
            )
          ],
        ),
        actions: [
          PopupMenuButton<int>(
              itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                    const PopupMenuItem<int>(
                        value: 2, child: Text(StringConstants.block)),
                  ],
              onSelected: (int value) {
                setState(() {
                  _value = value;
                });
              })
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1 -
              SizeConstants.chatPageBottomPadding,
          width: MediaQuery.of(context).size.width / 1,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 1.3,
                          width: MediaQuery.of(context).size.width / 1,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding:
                                  EdgeInsets.all(SizeConstants.mainPagePadding),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: SizeConstants.smallPadding,
                                  ),
                                  ReplyCardWidget(),
                                  SizedBox(
                                    height: SizeConstants.maximumPadding +
                                        SizeConstants.smallPadding,
                                  ),
                                  OtherCardWidget(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                  bottom: SizeConstants.mediumPadding,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: SizeConstants.bigPadding -
                              SizeConstants.mediumPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.35,
                            height: SizeConstants.buttonHeight,
                            decoration: BoxDecoration(
                              color: ThemeConfiguration.scaffoldBgColor,
                              borderRadius: BorderRadius.circular(35),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: CommonWidgets.inputField(
                                context: context,
                                hintText: StringConstants.typeMsgHint,
                                textInputType: TextInputType.text,
                                textFieldController: controller),
                          ),
                          Container(
                            width: SizeConstants.buttonHeight,
                            height: SizeConstants.buttonHeight,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ThemeConfiguration.scaffoldBgColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.send_outlined,
                              size: SizeConstants.mainPagePadding +
                                  SizeConstants.smallPadding,
                              color: ThemeConfiguration.primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
