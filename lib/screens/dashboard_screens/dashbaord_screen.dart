import 'dart:math';

import 'package:dating_app/Pages/Account/View/account_view.dart';
import 'package:dating_app/Pages/Messages/View/message_view.dart';
import 'package:dating_app/Pages/YourMatches/View/your_matches_view.dart';
import 'package:dating_app/screens/account/account_screen.dart';
import 'package:dating_app/screens/dashboard_screens/maches_screen.dart';
// import 'package:dating_app/screens/dashboard_screens /message/message_screen.dart';
// import 'package:dating_app/screens/messages_screens/messages_screen.dart';
import 'package:dating_app/screens/dashboard_screens/wallet_page.dart';
import 'package:dating_app/screens/messages_screens/messages_screen.dart';
import 'package:dating_app/screens/settings_screens/settings_page.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/image_utils.dart';
import 'package:dating_app/widgets/dashboard_widgets.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  List<Widget> pages = [
    AccountView(),
    WalletPage(),
    Container(),
    YourMatchesView(),
    MessageView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height / 1,
        width: MediaQuery.of(context).size.width / 1,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1,
              width: MediaQuery.of(context).size.width / 1,
              child: pages[currentIndex],
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                  color: ColorConstant.whiteColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 0;
                          });
                        },
                        child: bottomBarItemWidget(
                            isSelected: currentIndex == 0 ? true : false,
                            img: ImageUtils.first_tab_icon),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 1;
                          });
                        },
                        child: bottomBarItemWidget(
                            isSelected: currentIndex == 1 ? true : false,
                            img: ImageUtils.second_tab_icon),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 2;
                          });
                        },
                        child: bottomBarItemWidget(
                            isSelected: currentIndex == 2 ? true : false,
                            img: ImageUtils.third_tab_icon),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 3;
                          });
                        },
                        child: bottomBarItemWidget(
                            isSelected: currentIndex == 3 ? true : false,
                            img: ImageUtils.fourth_tab_icon),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 4;
                          });
                        },
                        child: bottomBarItemWidget(
                            isSelected: currentIndex == 4 ? true : false,
                            img: ImageUtils.fifth_tab_icon),
                      ),
                    ],
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
