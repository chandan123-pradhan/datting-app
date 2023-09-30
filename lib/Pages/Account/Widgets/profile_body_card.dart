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
  const ProfileBodyCard({super.key, required this.isFromEdit});

  @override
  Widget build(BuildContext context) {
    List<String> options = [
      '💃 Dancing',
      '🎮 Gaming',
      '🎬 Movie',
      '🎵 Music',
      '🍀 Nature',
    ];

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
          color: ColorConstant.whiteColor,
          border: Border.all(color: ColorConstant.primaryColor),
          borderRadius: BorderRadius.circular(Constant.normalCardBorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
              Constant.mainPagePadding + Constant.mediumPadding),
          child: Column(children: [
            OptionCardView(
              title: 'Kaushiki Kumari',
              isWidgetShow: false,
              image: ImageUtils.accountIcon,
              widget: null,
              isShowEditIcon: isFromEdit ?? false,
            ),
            const SizedBox(
              height: Constant.maximumPadding + Constant.mediumPadding,
            ),
            OptionCardView(
              title: '+91 1223344556',
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
                children: const [
                  Text(
                    StringUtils.yourBio,
                    style: TextStyle(color: ColorConstant.descriptiveColor),
                  ),
                  SizedBox(
                    height: Constant.smallPadding,
                  ),
                  Text(
                    'A good listner. I love having a good talk to know each other\'s side.',
                    style:
                        TextStyle(color: ColorConstant.commonAppBarTitleColor),
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
                    style: TextStyle(color: ColorConstant.descriptiveColor),
                  ),
                  const SizedBox(
                    height: Constant.mediumPadding,
                  ),
                  Center(
                    child: Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: options.asMap().entries.map((entry) {
                        int index = entry.key;
                        String option = entry.value;

                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          decoration: BoxDecoration(
                              color: ColorConstant.tinnyPrimaryColor
                                  .withOpacity(0.3),
                              borderRadius: BorderRadius.circular(35.0),
                              border: Border.all(
                                color: ColorConstant.primaryColor,
                              )),
                          child: Text(
                            option,
                            style: const TextStyle(
                                color: ColorConstant.descriptiveColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 11),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Constant.maximumPadding + Constant.mediumPadding,
            ),
            OptionCardView(
              title: '',
              isWidgetShow: true,
              image: ImageUtils.basicIcon,
              isShowEditIcon: isFromEdit ?? false,
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    StringUtils.myBasic,
                    style: TextStyle(color: ColorConstant.descriptiveColor),
                  ),
                  const SizedBox(
                    height: Constant.mediumPadding,
                  ),
                  Center(
                    child: Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: myBasics.asMap().entries.map((entry) {
                        int index = entry.key;
                        String myBasics = entry.value;

                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          decoration: BoxDecoration(
                              color: ColorConstant.tinnyPrimaryColor
                                  .withOpacity(0.3),
                              borderRadius: BorderRadius.circular(35.0),
                              border: Border.all(
                                color: ColorConstant.primaryColor,
                              )),
                          child: Text(
                            myBasics,
                            style: const TextStyle(
                                color: ColorConstant.descriptiveColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 11),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Constant.maximumPadding + Constant.mediumPadding,
            ),
            OptionCardView(
              title: '',
              isWidgetShow: true,
              image: ImageUtils.photoIcon,
              isShowEditIcon: isFromEdit ?? false,
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    StringUtils.photos,
                    style: TextStyle(color: ColorConstant.descriptiveColor),
                  ),
                  const SizedBox(
                    height: Constant.mediumPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 2.8,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorConstant.tinnyPrimaryColor),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: InkWell(
                            child: Image.asset(ImageUtils.galleryAddIcon),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (var i = 3; i < 5; i++)
                            Container(
                              height: MediaQuery.of(context).size.width / 5,
                              width: MediaQuery.of(context).size.width / 3 - 20,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorConstant.tinnyPrimaryColor),
                                  borderRadius: BorderRadius.circular(15)),
                              child: InkWell(
                                // onTap: _pickImage,
                                child: Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: Image.asset(
                                    ImageUtils.galleryAddIcon,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(
                            height: 5.0,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Constant.maximumPadding + Constant.mediumPadding,
            ),
            ButtonView(),
          ]),
        ),
      ),
    );
  }
}
