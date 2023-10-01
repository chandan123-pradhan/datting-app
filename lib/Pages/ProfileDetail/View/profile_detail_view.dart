import 'dart:io';

import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:flutter/material.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({super.key});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  List<String> options = [
    '💃 Dancing',
    '🎮 Gaming',
    '🎬 Movie',
    '🎵 Music',
    '🍀 Nature',
  ];
  List<String> basic = [
    '💃 183 cm',
    '🎮 Student',
    '🍀 Nature',
  ];
  List<File> images = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfiguration.blackColor,
      body: Stack(
        children: [
          NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.height / 2,
                  pinned: true,
                  snap: true,
                  primary: true,
                  floating: true,
                  stretch: true,
                  excludeHeaderSemantics: true,
                  backgroundColor: ThemeConfiguration.primaryColor,
                  elevation: 0,
                  foregroundColor: ThemeConfiguration.commonAppBarBgColor,
                  surfaceTintColor: ThemeConfiguration.primaryColor,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
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
                                SizeConstants.mainContainerContentPadding +
                                    SizeConstants.mainContainerContentPadding +
                                    SizeConstants.mainContainerContentPadding),
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
                            )),
                             
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Container(
                  decoration: const BoxDecoration(
                      color: ThemeConfiguration.scaffoldBgColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              SizeConstants.textFieldCardBorderRadius),
                          topRight: Radius.circular(
                              SizeConstants.textFieldCardBorderRadius))),
                  child: Builder(builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(SizeConstants.bigPadding),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _aboutView(),
                            const SizedBox(
                              height: SizeConstants.maximumPadding,
                            ),
                            _interestView(),
                            const SizedBox(
                              height: SizeConstants.maximumPadding,
                            ),
                            _myBasicView(),
                            const SizedBox(
                              height: SizeConstants.maximumPadding,
                            ),
                            _photosView(),
                            const SizedBox(
                              height: SizeConstants.genderContainerSize,
                            ),
                            const SizedBox(
                              height: SizeConstants.genderContainerSize,
                            ),
                          ]),
                    );
                  })),
            ),
          ),
       Positioned(
         bottom: 20,
         left: MediaQuery.of(context).size.width/3,
         right: MediaQuery.of(context).size.width/3,
         child: Container(
           decoration: BoxDecoration(borderRadius:BorderRadius.circular(SizeConstants.textFieldCardBorderRadius+SizeConstants.textFieldCardBorderRadius+SizeConstants.textFieldCardBorderRadius),
           color: ThemeConfiguration.scaffoldBgColor,
           boxShadow: [
             BoxShadow(spreadRadius: 1,
             color: ThemeConfiguration.primaryColor.withOpacity(0.3),
             offset: const Offset(0, 3),
             blurRadius: 10)
           ]),
         child: Center(
           child: Padding(
             padding: const EdgeInsets.all(SizeConstants.mediumPadding),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Image.asset(ImageConstants.heartCircle,height: SizeConstants.buttonHeight,width: SizeConstants.buttonHeight,),
               const SizedBox(width: SizeConstants.mediumPadding,),
                 Image.asset(ImageConstants.crossCircle,height: SizeConstants.buttonHeight,width: SizeConstants.buttonHeight,),

               ],),
           ),
         ),),
       ) ],
      ),
    );
  }

  _aboutView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConstants.about,
          style: ThemeConfiguration.commonTextStyle(
              14.0, FontWeight.w500, ThemeConfiguration.descriptiveColor),
        ),
        const SizedBox(
          height: SizeConstants.smallPadding,
        ),
        Text(
          'A good listener. I love having a good talk to know each other’s side 🙂.',
          style: ThemeConfiguration.commonTextStyle(
              14.0, FontWeight.w500, ThemeConfiguration.commonAppBarTitleColor),
        ),
      ],
    );
  }

  _interestView() {
    return MyInterestsWidget(options: options);
  }

  _myBasicView() {
    return MyBasicWidget(basic: basic);
  }

  _photosView() {
    return Padding(
      padding: const EdgeInsets.only(right: SizeConstants.mainPagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConstants.photos,
            style: ThemeConfiguration.commonTextStyle(
                14.0, FontWeight.w500, ThemeConfiguration.descriptiveColor),
          ),
          const SizedBox(
            height: SizeConstants.mediumPadding,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: SizeConstants.mediumPadding),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3.5,
                        width: MediaQuery.of(context).size.width / 1,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: ThemeConfiguration.primaryLightColor),
                            borderRadius: BorderRadius.circular(
                                SizeConstants.mainPagePadding)),
                        child: images.isNotEmpty
                            ? Image.file(
                                images.first,
                                fit: BoxFit.cover,
                              )
                            : InkWell(
                                // onTap: _pickImage,
                                child:
                                    Image.asset(ImageConstants.galleryAddIcon),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  for (var i = 0; i < 2; i++)
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: SizeConstants.mediumPadding),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3.65 / 2,
                        width: MediaQuery.of(context).size.width / 3.5,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: ThemeConfiguration.primaryLightColor),
                            borderRadius: BorderRadius.circular(
                                SizeConstants.mainPagePadding)),
                        child: images.length > i + 1
                            ? Image.file(
                                images[i + 1],
                                fit: BoxFit.cover,
                              )
                            : InkWell(
                                // onTap: _pickImage,
                                child: Padding(
                                  padding: const EdgeInsets.all(40.0),
                                  child: Image.asset(
                                    ImageConstants.galleryAddIcon,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyInterestsWidget extends StatelessWidget {
  const MyInterestsWidget({
    super.key,
    required this.options,
  });

  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConstants.interest,
          style: ThemeConfiguration.commonTextStyle(
              14.0, FontWeight.w500, ThemeConfiguration.descriptiveColor),
        ),
        const SizedBox(
          height: SizeConstants.mediumPadding,
        ),
        Center(
          child: Wrap(
            spacing: 25.0,
            runSpacing: 10.0,
            children: options.asMap().entries.map((entry) {
              int index = entry.key;
              String option = entry.value;
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: SizeConstants.mainPagePadding,
                  vertical: SizeConstants.smallPadding,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        SizeConstants.textFieldCardBorderRadius),
                    border: Border.all(
                      color: ThemeConfiguration.border2Color,
                    )),
                child: Text(
                  option,
                  style: const TextStyle(
                    color: ThemeConfiguration.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class MyBasicWidget extends StatelessWidget {
  const MyBasicWidget({
    super.key,
    required this.basic,
  });

  final List<String> basic;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConstants.myBasic,
          style: ThemeConfiguration.commonTextStyle(
              14.0, FontWeight.w500, ThemeConfiguration.descriptiveColor),
        ),
        const SizedBox(
          height: SizeConstants.mediumPadding,
        ),
        Center(
          child: Wrap(
            spacing:SizeConstants.mediumPadding,
            children: basic.asMap().entries.map((entry) {
              int index = entry.key;
              String basic = entry.value;
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: SizeConstants.mainPagePadding,
                  vertical: SizeConstants.smallPadding,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        SizeConstants.textFieldCardBorderRadius),
                    border: Border.all(
                      color: ThemeConfiguration.border2Color,
                    )),
                child: Text(
                  basic,
                  style: const TextStyle(
                    color: ThemeConfiguration.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
