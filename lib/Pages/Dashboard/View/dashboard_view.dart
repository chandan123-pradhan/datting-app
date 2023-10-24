import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Pages/Account/Bloc/account_bloc.dart';
import 'package:dating_app/Pages/Account/Bloc/account_repository.dart';
import 'package:dating_app/Pages/Account/View/account_view.dart';
import 'package:dating_app/Pages/Dashboard/Widgets/dashboard_widgets.dart';
import 'package:dating_app/Pages/Map/View/map_view.dart';
import 'package:dating_app/Pages/Messages/View/message_view.dart';
import 'package:dating_app/Pages/YourMatches/View/your_matches_view.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../InterestedInYou/View/interested_in_you_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int currentIndex = 0;

  List<Widget> pages = [
    BlocProvider<AccountBloc>(
        create: (context) =>
            AccountBloc(repository: AccountRepositoryImp()),
        child: const AccountView()),
    InterestedInYouView(),
    MapView(),
    YourMatchesView(),
    MessageView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfiguration.scaffoldBgColor,
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
                // height: 50,
                width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                  color: ThemeConfiguration.whiteColor,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
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
                            img: ImageConstants.firstTabIcon),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 1;
                          });
                        },
                        child: bottomBarItemWidget(
                            isSelected: currentIndex == 1 ? true : false,
                            img: ImageConstants.secondTabIcon),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 2;
                          });
                        },
                        child: bottomBarItemWidget(
                            isSelected: currentIndex == 2 ? true : false,
                            img: ImageConstants.thirdTabIcon),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 3;
                          });
                        },
                        child: bottomBarItemWidget(
                            isSelected: currentIndex == 3 ? true : false,
                            img: ImageConstants.fourthTabIcon),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 4;
                          });
                        },
                        child: bottomBarItemWidget(
                            isSelected: currentIndex == 4 ? true : false,
                            img: ImageConstants.fifthTabIcon),
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
