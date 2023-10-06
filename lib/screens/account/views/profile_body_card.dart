import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/screens/account/views/button_view.dart';
import 'package:dating_app/screens/account/views/option_card_view.dart';
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
          color: ThemeConfiguration.whiteColor,
          border: Border.all(color: ThemeConfiguration.primaryColor),
          borderRadius:
              BorderRadius.circular(SizeConstants.normalCardBorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
              SizeConstants.mainPagePadding + SizeConstants.mediumPadding),
          child: Column(children: [
            OptionCardView(
              title: 'Kaushiki Kumari',
              isWidgetShow: false,
              image: ImageConstants.accountIcon,
              widget: null,
              isShowEditIcon: isFromEdit ?? false,
            ),
            const SizedBox(
              height:
                  SizeConstants.maximumPadding + SizeConstants.mediumPadding,
            ),
            OptionCardView(
              title: '+91 1223344556',
              isWidgetShow: false,
              image: ImageConstants.callIcon,
              widget: null,
              isShowEditIcon: isFromEdit ?? false,
            ),
            const SizedBox(
              height:
                  SizeConstants.maximumPadding + SizeConstants.mediumPadding,
            ),
            OptionCardView(
              title: '',
              isWidgetShow: true,
              image: ImageConstants.accountEditIcon,
              isShowEditIcon: isFromEdit ?? false,
              widget: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.yourBio,
                    style:
                        TextStyle(color: ThemeConfiguration.descriptiveColor),
                  ),
                  SizedBox(
                    height: SizeConstants.smallPadding,
                  ),
                  Text(
                    'A good listner. I love having a good talk to know each other\'s side.',
                    style: TextStyle(
                        color: ThemeConfiguration.commonAppBarTitleColor),
                  )
                ],
              ),
            ),
            const SizedBox(
              height:
                  SizeConstants.maximumPadding + SizeConstants.mediumPadding,
            ),
            OptionCardView(
              title: '',
              isWidgetShow: true,
              image: ImageConstants.heartIcon,
              isShowEditIcon: isFromEdit ?? false,
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    StringConstants.yourIntrest,
                    style:
                        TextStyle(color: ThemeConfiguration.descriptiveColor),
                  ),
                  const SizedBox(
                    height: SizeConstants.mediumPadding,
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
                              color: ThemeConfiguration.primaryLightColor
                                  .withOpacity(0.3),
                              borderRadius: BorderRadius.circular(35.0),
                              border: Border.all(
                                color: ThemeConfiguration.primaryColor,
                              )),
                          child: Text(
                            option,
                            style: const TextStyle(
                                color: ThemeConfiguration.descriptiveColor,
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
              height:
                  SizeConstants.maximumPadding + SizeConstants.mediumPadding,
            ),
            OptionCardView(
              title: '',
              isWidgetShow: true,
              image: ImageConstants.basicIcon,
              isShowEditIcon: isFromEdit ?? false,
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    StringConstants.myBasic,
                    style:
                        TextStyle(color: ThemeConfiguration.descriptiveColor),
                  ),
                  const SizedBox(
                    height: SizeConstants.mediumPadding,
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
                              color: ThemeConfiguration.primaryLightColor
                                  .withOpacity(0.3),
                              borderRadius: BorderRadius.circular(35.0),
                              border: Border.all(
                                color: ThemeConfiguration.primaryColor,
                              )),
                          child: Text(
                            myBasics,
                            style: const TextStyle(
                                color: ThemeConfiguration.descriptiveColor,
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
              height:
                  SizeConstants.maximumPadding + SizeConstants.mediumPadding,
            ),
            OptionCardView(
              title: '',
              isWidgetShow: true,
              image: ImageConstants.photoIcon,
              isShowEditIcon: isFromEdit ?? false,
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    StringConstants.photos,
                    style:
                        TextStyle(color: ThemeConfiguration.descriptiveColor),
                  ),
                  const SizedBox(
                    height: SizeConstants.mediumPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: ThemeConfiguration.primaryLightColor),
                            borderRadius: BorderRadius.circular(
                                SizeConstants.normalCardBorderRadius)),
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: InkWell(
                            child: Image.asset(ImageConstants.galleryAddIcon),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (var i = 3; i < 5; i++)
                            Container(
                              height:
                                  MediaQuery.of(context).size.height / 4.2 / 2,
                              width: MediaQuery.of(context).size.width / 3.5,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          ThemeConfiguration.primaryLightColor),
                                  borderRadius: BorderRadius.circular(
                                      SizeConstants.normalCardBorderRadius)),
                              child: InkWell(
                                // onTap: _pickImage,
                                child: Padding(
                                  padding: const EdgeInsets.all(35.0),
                                  child: Image.asset(
                                    ImageConstants.galleryAddIcon,
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
              height: SizeConstants.maximumPadding,
            ),
            ButtonView(),
          ]),
        ),
      ),
    );
  }
}
