import 'dart:developer';
import 'dart:io';

import 'package:dating_app/CommonWidgets/profile_screen_loading_widget.dart';
import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Helper/loader_helper.dart';
import 'package:dating_app/Helper/navigation_helper.dart';
import 'package:dating_app/Helper/toast_helper.dart';
import 'package:dating_app/Pages/Map/controllers/GetOtherUserProfileController.dart';
import 'package:dating_app/Pages/ProfileDetail/Bloc/profile_detail_bloc.dart';
import 'package:dating_app/Pages/ProfileDetail/Bloc/profile_detail_event.dart';
import 'package:dating_app/Pages/ProfileDetail/Bloc/profile_detail_state.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ProfileDetailView extends StatefulWidget {
  Map params;
  ProfileDetailView({required this.params});

  @override
  State<ProfileDetailView> createState() => _ProfileDetailViewState();
}

class _ProfileDetailViewState extends State<ProfileDetailView> {
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

  ProfileDetailBloc? ProfileDetailViewBloc;
  bool isLoading = false;

  var controller = Get.put(GetOtherUserProfileController());

  @override
  void initState() {
    ProfileDetailViewBloc = context.read<ProfileDetailBloc>();
    ProfileDetailViewBloc?.add(GetProfileDetailData());

    controller.getOtherUserProfile(widget.params['id'], context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildUi();
  }

  _buildUi() {
    return BlocBuilder<ProfileDetailBloc, ProfileDetailState>(
        builder: (context, currentState) {
      if (kDebugMode) {
        print(currentState);
      }
      if (currentState is ProfileDetailInitialState) {
      } else if (currentState is ProfileDetailLoadingState) {
        isLoading = true;
      } else if (currentState is ProfileDetailSuccessState) {
        isLoading = false;
        ToastHelper().showMsg(
            context: context,
            message: currentState.userDataModel?.message ?? '');
        ProfileDetailViewBloc?.emit(ProfileDetailEmptyState());
      } else if (currentState is ProfileDetailErrorState) {
        isLoading = false;
        ToastHelper()
            .showErrorMsg(context: context, message: currentState.errorMessage);
      }
      return _buildMainUi();
    });
  }

  _buildMainUi() {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: ThemeConfiguration.blackColor,
          body: GetBuilder<GetOtherUserProfileController>(
              init: GetOtherUserProfileController(),
              builder: (controller) {
                return controller.getOtherUserProfileResponse == null
                    ? Container(
                      height: MediaQuery.of(context).size.height/1,
                      color: ColorConstant.backgroundColor,
                      child: const Padding(
                        padding: EdgeInsets.only(top:50.0),
                        child: ProfileScreenShimer(),
                      ))
                    : Stack(
                        children: [
                          NestedScrollView(
                            headerSliverBuilder: (BuildContext context,
                                bool innerBoxIsScrolled) {
                              return <Widget>[
                                SliverAppBar(
                                  expandedHeight:
                                      MediaQuery.of(context).size.height / 2,
                                  pinned: true,
                                  snap: true,
                                  primary: true,
                                  floating: true,
                                  stretch: true,
                                  excludeHeaderSemantics: true,
                                  backgroundColor:
                                      ThemeConfiguration.primaryColor,
                                  elevation: 0,
                                  foregroundColor:
                                      ThemeConfiguration.commonAppBarBgColor,
                                  surfaceTintColor:
                                      ThemeConfiguration.primaryColor,
                                  flexibleSpace: FlexibleSpaceBar(
                                    background: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: NetworkImage(controller
                                                    .getOtherUserProfileResponse!
                                                    .imgUrl +
                                                controller
                                                    .getOtherUserProfileResponse!
                                                    .data
                                                    .image),
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
                                            padding: const EdgeInsets
                                                .all(SizeConstants
                                                    .mainContainerContentPadding +
                                                SizeConstants
                                                    .mainContainerContentPadding +
                                                SizeConstants
                                                    .mainContainerContentPadding),
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Text(
                                                '${controller.getOtherUserProfileResponse!.data.fullName}',
                                                style: ThemeConfiguration
                                                    .commonTextStyle(
                                                  24.0,
                                                  FontWeight.w700,
                                                  ThemeConfiguration
                                                      .commonAppBarBgColor,
                                                ),
                                              ),
                                            )),
                                        Padding(
                                            padding: const EdgeInsets.all(
                                                SizeConstants
                                                    .mainContainerContentPadding),
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Text(
                                                '${controller.getOtherUserProfileResponse!.data.locationCity}',
                                                style: ThemeConfiguration
                                                    .commonTextStyle(
                                                  16.0,
                                                  FontWeight.w700,
                                                  ThemeConfiguration
                                                      .commonAppBarBgColor,
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ];
                            },
                            body: Container(
                              child: Container(
                                  decoration: const BoxDecoration(
                                      color: ThemeConfiguration.scaffoldBgColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(SizeConstants
                                              .textFieldCardBorderRadius),
                                          topRight: Radius.circular(
                                              SizeConstants
                                                  .textFieldCardBorderRadius))),
                                  child: Builder(builder: (context) {
                                    return Padding(
                                      padding: const EdgeInsets.all(
                                          SizeConstants.bigPadding),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            _aboutView(),
                                            const SizedBox(
                                              height:
                                                  SizeConstants.maximumPadding,
                                            ),
                                            _interestView(),
                                            const SizedBox(
                                              height:
                                                  SizeConstants.maximumPadding,
                                            ),
                                            // _myBasicView(),
                                            // const SizedBox(
                                            //   height:
                                            //       SizeConstants.maximumPadding,
                                            // ),
                                            _photosView(),
                                            // const SizedBox(
                                            //   height: SizeConstants
                                            //       .genderContainerSize,
                                            // ),
                                            // const SizedBox(
                                            //   height: SizeConstants
                                            //       .genderContainerSize,
                                            // ),
                                          ]),
                                    );
                                  })),
                            ),
                          ),
                          
                            
                         widget.params['isForlike']==true?
                         
                            Positioned(
                            bottom: 20,
                            left: MediaQuery.of(context).size.width / 1.2,
                              // right: MediaQuery.of(context).size.width / 2.5,
                            child:  Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      SizeConstants.textFieldCardBorderRadius +
                                          SizeConstants
                                              .textFieldCardBorderRadius +
                                          SizeConstants
                                              .textFieldCardBorderRadius),
                                  color: ThemeConfiguration.scaffoldBgColor,
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 1,
                                        color: ThemeConfiguration.primaryColor
                                            .withOpacity(0.3),
                                        offset: const Offset(0, 3),
                                        blurRadius: 10)
                                  ]),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                      SizeConstants.mediumPadding),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                    

                                     controller.isLiked==true
                                          ? Container(
                                              height: 45,
                                              width: 45,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: ColorConstant
                                                      .primaryColor),
                                              alignment: Alignment.center,
                                              child: const Icon(
                                                Icons.favorite,
                                                color: Colors.white,
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () {
                                                controller.callCoinsDeductionDialog(
                                                    widget.params['id'], context,'20');
                                              },
                                              child: Container(
                                                height: 45,
                                                width: 45,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: 1,
                                                        color: ColorConstant
                                                            .primaryColor)),
                                                alignment: Alignment.center,
                                                child: const Icon(
                                                  Icons.favorite_border,
                                                  color: ColorConstant
                                                      .primaryColor,
                                                ),
                                              ))
                                      //   Image.asset(
                                      //     ImageConstants.crossCircle,

                                      // height: SizeConstants.buttonHeight,
                                      // width: SizeConstants.buttonHeight,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                      
                            )     
                         
                         :   
                            
                            
                         Positioned(
                            bottom: 20,
                            left: MediaQuery.of(context).size.width / 3,
                               right: MediaQuery.of(context).size.width / 3,
                            child:    
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      SizeConstants.textFieldCardBorderRadius +
                                          SizeConstants
                                              .textFieldCardBorderRadius +
                                          SizeConstants
                                              .textFieldCardBorderRadius),
                                  color: ThemeConfiguration.scaffoldBgColor,
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 1,
                                        color: ThemeConfiguration.primaryColor
                                            .withOpacity(0.3),
                                        offset: const Offset(0, 3),
                                        blurRadius: 10)
                                  ]),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                      SizeConstants.mediumPadding),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                           controller.acceptOrReject(
                                                  widget.params['user_id'],
                                                '3',
                                                context
                                                  
                                                  );
                                        },
                                        child: Image.asset(
                                          ImageConstants.heartCircle,
                                          height: SizeConstants.buttonHeight,
                                          width: SizeConstants.buttonHeight,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: SizeConstants.mediumPadding,
                                      ),

                                    InkWell(
                                              onTap: () {
                                                controller.acceptOrReject(
                                                   widget.params['user_id'],
                                                '2'
                                                  ,context
                                                  );
                                              },
                                              child: Container(
                                                height: 45,
                                                width: 45,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: 1,
                                                        color: ColorConstant
                                                            .primaryColor)),
                                                alignment: Alignment.center,
                                                child: const Icon(
                                                  Icons.favorite_border,
                                                  color: ColorConstant
                                                      .primaryColor,
                                                ),
                                              ))
                                      //   Image.asset(
                                      //     ImageConstants.crossCircle,

                                      // height: SizeConstants.buttonHeight,
                                      // width: SizeConstants.buttonHeight,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                      
                      
                      
                      
                          )
                        ],
                      );
              }),
        ),
        // Visibility(
        //   visible: isLoading == true,
        //   child: LoaderHelper.pageLoader(),
        // )
      ],
    );
  }

  _aboutView() {
    return GetBuilder<GetOtherUserProfileController>(
        init: GetOtherUserProfileController(),
        builder: (controller) {
          return SizedBox(
            width: MediaQuery.of(context).size.width / 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  StringConstants.about,
                  style: ThemeConfiguration.commonTextStyle(14.0,
                      FontWeight.w500, ThemeConfiguration.descriptiveColor),
                ),
                const SizedBox(
                  height: SizeConstants.smallPadding,
                ),
                Text(
                  '${controller.getOtherUserProfileResponse!.data.about}',
                  style: ThemeConfiguration.commonTextStyle(
                      14.0,
                      FontWeight.w500,
                      ThemeConfiguration.commonAppBarTitleColor),
                ),
              ],
            ),
          );
        });
  }

  _interestView() {
    return MyInterestsWidget(options: options);
  }

  _myBasicView() {
    return MyBasicWidget(basic: basic);
  }

  _photosView() {
    return GetBuilder<GetOtherUserProfileController>(
        init: GetOtherUserProfileController(),
        builder: (controller) {
          return Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(right: SizeConstants.mainPagePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.photos,
                    style: ThemeConfiguration.commonTextStyle(14.0,
                        FontWeight.w500, ThemeConfiguration.descriptiveColor),
                  ),
                  const SizedBox(
                    height: SizeConstants.mediumPadding,
                  ),
                  Expanded(
                    child: Container(
                        // height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: GridView.builder(
                          itemCount: controller
                              .getOtherUserProfileResponse!.data.images.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                // height: MediaQuery.of(context).size.width / 3.8 -
                                //     SizeConstants.mainPagePadding,
                                // width: MediaQuery.of(context).size.width / 3.8 -
                                //     SizeConstants.mainPagePadding,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ThemeConfiguration
                                            .primaryLightColor),
                                    borderRadius: BorderRadius.circular(
                                        SizeConstants.mainPagePadding)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        SizeConstants.mainPagePadding - 1),
                                    child: Image.network(
                                      controller.getOtherUserProfileResponse!
                                              .imgUrl +
                                          controller
                                              .getOtherUserProfileResponse!
                                              .data
                                              .images[index]
                                              .image,
                                      fit: BoxFit.cover,
                                    ))

                                // Positioned(
                                //     top: SizeConstants.mainPagePadding +
                                //         SizeConstants.altraSmallPadding,
                                //     right: 0,
                                //     child: InkWell(
                                //         onTap: () {
                                //           setState(() {
                                //             imageUrls.removeAt(index);
                                //           });
                                //         },
                                //         child: const Icon(
                                //           Icons.cancel,
                                //           color: ThemeConfiguration.buttonColor,
                                //         )))
                                );
                          },
                        )),
                  ),
                ],
              ),
            ),
          );
        });
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
    return GetBuilder<GetOtherUserProfileController>(
        init: GetOtherUserProfileController(),
        builder: (controller) {
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
                  children: controller.getOtherUserProfileResponse!.data.intrest
                      .asMap()
                      .entries
                      .map((entry) {
                    int index = entry.key;
                    String option = entry.value.intrest;
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
        });
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
    return GetBuilder<GetOtherUserProfileController>(
        init: GetOtherUserProfileController(),
        builder: (controller) {
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
                  spacing: SizeConstants.mediumPadding,
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
        });
  }
}
