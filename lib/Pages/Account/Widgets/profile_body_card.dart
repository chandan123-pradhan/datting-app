import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Models/userdata_model.dart';
import 'package:dating_app/Pages/Account/Widgets/account_button_widget.dart';
import 'package:dating_app/Pages/Register/Model/interest_response_model.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/screens/account/views/button_view.dart';
import 'package:dating_app/screens/account/views/option_card_view.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/constants.dart';
import 'package:dating_app/utils/image_utils.dart';
import 'package:dating_app/utils/string_utils.dart';
import 'package:dating_app/utils/text_styles.dart';
import 'package:flutter/material.dart';

class ProfileBodyCard extends StatelessWidget {
  final bool? isFromEdit;
  final UserDataModel? userDataModel;
  const ProfileBodyCard(
      {super.key,
      required this.isFromEdit,
      required this.userDataModel});

  @override
  Widget build(BuildContext context) {

    List<String> myBasics = [
      '👩‍🎓 Student',
      '👱🏻‍♀️ Women',
      '👤 183 cm',
    ];
    var deviceSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: deviceSize.width / 1,
        decoration: BoxDecoration(
          color: ThemeConfiguration.whiteColor,
          border: Border.all(color: ThemeConfiguration.primaryColor),
          borderRadius: BorderRadius.circular(Constant.normalCardBorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
              Constant.mainPagePadding + Constant.mediumPadding),
          child: Column(children: [
            OptionCardView(
              title: userDataModel?.data?.fullName ?? '',
              isWidgetShow: false,
              image: ImageUtils.accountIcon,
              widget: null,
              isShowEditIcon: isFromEdit ?? false,
            ),
            const SizedBox(
              height: Constant.maximumPadding + Constant.mediumPadding,
            ),
            OptionCardView(
              title: '+91 ${userDataModel?.data?.mobileNumber ?? ''}',
              isWidgetShow: false,
              image: ImageUtils.callIcon,
              widget: null,
              isShowEditIcon: isFromEdit ?? false,
            ),
            const SizedBox(
              height: Constant.maximumPadding + Constant.mediumPadding,
            ),
            OptionCardView(
              title: '',
              isWidgetShow: true,
              image: ImageUtils.accountEditIcon,
              isShowEditIcon: isFromEdit ?? false,
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringUtils.yourBio,
                    style:
                        TextStyle(color: ThemeConfiguration.descriptiveColor),
                  ),
                  SizedBox(
                    height: Constant.smallPadding,
                  ),
                  Text(
                    userDataModel?.data?.about ?? '',
                    style: TextStyle(
                        color: ThemeConfiguration.commonAppBarTitleColor),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: Constant.maximumPadding + Constant.mediumPadding,
            ),
            OptionCardView(
              title: '',
              isWidgetShow: true,
              image: ImageUtils.heartIcon,
              isShowEditIcon: isFromEdit ?? false,
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    StringUtils.yourIntrest,
                    style:
                        TextStyle(color: ThemeConfiguration.descriptiveColor),
                  ),
                  const SizedBox(
                    height: Constant.mediumPadding,
                  ),
                  GridView.builder(
                    itemCount: (userDataModel?.data?.interests??[]).length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 3,
                            mainAxisSpacing: SizeConstants.mediumPadding,
                            crossAxisSpacing: SizeConstants.mediumPadding),
                    itemBuilder: (context, index) {
                      return Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          decoration: BoxDecoration(
                              color: ThemeConfiguration.primaryLightColor
                                  .withOpacity(0.3),
                              borderRadius: BorderRadius.circular(35.0),
                              border: Border.all(
                                color: ThemeConfiguration.primaryColor,
                              )),
                          child: Center(
                            child: Text(
                              userDataModel?.data?.interests[index].intrest??'',
                              style: const TextStyle(
                                  color: ThemeConfiguration.descriptiveColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   height: Constant.maximumPadding + Constant.mediumPadding,
            // ),
            // OptionCardView(
            //   title: '',
            //   isWidgetShow: true,
            //   image: ImageUtils.basicIcon,
            //   isShowEditIcon: widget.isFromEdit ?? false,
            //   widget: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const Text(
            //         StringUtils.myBasic,
            //         style:
            //             TextStyle(color: ThemeConfiguration.descriptiveColor),
            //       ),
            //       const SizedBox(
            //         height: Constant.mediumPadding,
            //       ),
            //       GridView.builder(
            //         itemCount: myBasics.length,
            //         shrinkWrap: true,
            //         physics: const NeverScrollableScrollPhysics(),
            //         gridDelegate:
            //             const SliverGridDelegateWithFixedCrossAxisCount(
            //                 crossAxisCount: 3,
            //                 childAspectRatio: 3,
            //                 mainAxisSpacing: SizeConstants.mediumPadding,
            //                 crossAxisSpacing: SizeConstants.mediumPadding),
            //         itemBuilder: (context, index) {
            //           return Center(
            //             child: Container(
            //               padding: const EdgeInsets.symmetric(
            //                   horizontal: 10.0, vertical: 5.0),
            //               decoration: BoxDecoration(
            //                   color: ThemeConfiguration.primaryLightColor
            //                       .withOpacity(0.3),
            //                   borderRadius: BorderRadius.circular(35.0),
            //                   border: Border.all(
            //                     color: ThemeConfiguration.primaryColor,
            //                   )),
            //               child: Center(
            //                 child: Text(
            //                   myBasics[index],
            //                   style: const TextStyle(
            //                       color: ThemeConfiguration.descriptiveColor,
            //                       fontWeight: FontWeight.w500,
            //                       fontSize: 11),
            //                 ),
            //               ),
            //             ),
            //           );
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(
            //   height: Constant.maximumPadding + Constant.mediumPadding,
            // ),
            // OptionCardView(
            //   title: '',
            //   isWidgetShow: true,
            //   image: ImageUtils.photoIcon,
            //   isShowEditIcon: widget.isFromEdit ?? false,
            //   widget: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const Text(
            //         StringUtils.photos,
            //         style:
            //             TextStyle(color: ThemeConfiguration.descriptiveColor),
            //       ),
            //       const SizedBox(
            //         height: Constant.mediumPadding,
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Expanded(
            //             child: Container(
            //               decoration: BoxDecoration(
            //                   border: Border.all(
            //                       color: ThemeConfiguration.primaryLightColor),
            //                   borderRadius: BorderRadius.circular(15)),
            //               child: Padding(
            //                 padding: const EdgeInsets.all(50.0),
            //                 child: InkWell(
            //                   child: Image.asset(ImageUtils.galleryAddIcon),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           const SizedBox(
            //             width: SizeConstants.mediumPadding,
            //           ),
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Container(
            //                 height: MediaQuery.of(context).size.width / 4.7,
            //                 width: MediaQuery.of(context).size.width / 4.7,
            //                 decoration: BoxDecoration(
            //                     border: Border.all(
            //                         color:
            //                             ThemeConfiguration.primaryLightColor),
            //                     borderRadius: BorderRadius.circular(15)),
            //                 child: InkWell(
            //                   // onTap: _pickImage,
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(35.0),
            //                     child: Image.asset(
            //                       ImageUtils.galleryAddIcon,
            //                       fit: BoxFit.fill,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               const SizedBox(
            //                 height: SizeConstants.mediumPadding,
            //               ),
            //               Container(
            //                 height: MediaQuery.of(context).size.width / 4.7,
            //                 width: MediaQuery.of(context).size.width / 4.7,
            //                 decoration: BoxDecoration(
            //                     border: Border.all(
            //                         color:
            //                             ThemeConfiguration.primaryLightColor),
            //                     borderRadius: BorderRadius.circular(15)),
            //                 child: InkWell(
            //                   // onTap: _pickImage,
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(35.0),
            //                     child: Image.asset(
            //                       ImageUtils.galleryAddIcon,
            //                       fit: BoxFit.fill,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           )
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(
            //   height: Constant.maximumPadding + Constant.mediumPadding,
            // ),
          ]),
        ),
      ),
    );
  }
}
