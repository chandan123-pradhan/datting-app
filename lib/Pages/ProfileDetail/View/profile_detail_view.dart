import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:flutter/material.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({super.key});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfiguration.scaffoldBgColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height / 2,
         pinned: true,
         backgroundColor: ThemeConfiguration.primaryColor,
         elevation: 0,
         foregroundColor:  ThemeConfiguration.primaryColor,
         surfaceTintColor:  ThemeConfiguration.primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Container(
                    decoration:const BoxDecoration(

                        image:  DecorationImage(
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
                    child: Image.asset(
                      ImageConstants.profileCardBg,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(
                          SizeConstants.mainContainerContentPadding+
                          SizeConstants.mainContainerContentPadding+SizeConstants.mainContainerContentPadding),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Jenny Cruz, 28',
                          style: ThemeConfiguration.commonTextStyle(
                            24.0,
                            FontWeight.w700,
                            ThemeConfiguration.commonAppBarBgColor,
                          ),
                        ),
                      )),
                      Padding(
                      padding: const EdgeInsets.all(
                          SizeConstants.mainContainerContentPadding),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Navi Mumbai',
                          style: ThemeConfiguration.commonTextStyle(
                            16.0,
                            FontWeight.w700,
                            ThemeConfiguration.commonAppBarBgColor,
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(),
            Container(),
                        Container(),
             ]),
            ),

        ],
      ),
    );
  }


  ///SliverToBoxAdapter
}
