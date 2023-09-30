import 'package:dating_app/common_widgets/common_app_bar.dart';
import 'package:dating_app/screens/account/views/button_view.dart';
import 'package:dating_app/screens/account/views/profile_body_card.dart';
import 'package:dating_app/screens/account/views/profile_card_view.dart';
import 'package:dating_app/screens/edit_account/views/edit_intrests_view.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/constants.dart';
import 'package:dating_app/utils/image_utils.dart';
import 'package:dating_app/utils/string_utils.dart';
import 'package:dating_app/widgets/text_field_widgets.dart';
import 'package:flutter/material.dart';

import '../account/views/option_card_view.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bioController = TextEditingController();
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
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConstant.scaffoldBgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: CommonAppBar(
          title: StringUtils.editProfile,
          onEdit: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const EditAccountScreen()),
            );
          },
          onSetting: () {},
          editShow: false,
          settingShow: true,
          isBack: true,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Constant.mainPagePadding),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: Constant.profileAvatarRadius,
                    backgroundColor: ColorConstant.cardShadowColor,
                  ),
                  const Positioned(
                      right: 0.0,
                      bottom: 5.0,
                      child: CircleAvatar(
                        radius: Constant.profileAvatarEditRadius,
                        backgroundImage:
                            AssetImage(ImageUtils.profilePicEditButton),
                      ))
                ],
              ),
              const SizedBox(
                height: Constant.maximumPadding,
              ),
              const SizedBox(height: Constant.maximumPadding),
              Padding(
                  padding: const EdgeInsets.fromLTRB(Constant.maximumPadding,
                      Constant.maximumPadding, Constant.maximumPadding, 0),
                  child: TextFieldWidgets.inputField(
                    context: context,
                    textFieldController: nameController,
                    hintText: StringUtils.editName,
                    textInputType: TextInputType.text,
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(Constant.maximumPadding,
                    Constant.maximumPadding, Constant.maximumPadding, 0),
                child: TextFieldWidgets.mobileNumberInputTextField(
                    context: context, textFieldController: phoneController),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(Constant.maximumPadding,
                    Constant.maximumPadding, Constant.maximumPadding, 0),
                child: TextFieldWidgets.inputField(
                  context: context,
                  textFieldController: bioController,
                  hintText: StringUtils.editBio,
                  textInputType: TextInputType.text,
                ),
              ),
              const SizedBox(
                height: Constant.smallPadding,
              ),
              Padding(
                padding: const EdgeInsets.all(Constant.mainPagePadding),
                child: OptionCardView(
                  title: '',
                  isWidgetShow: true,
                  image: ImageUtils.heartIcon,
                  isShowEditIcon: true,
                  onEdit: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditInterestView()),
                    );
                  },
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
              ),
              Padding(
                padding: const EdgeInsets.all(Constant.maximumPadding),
                child: OptionCardView(
                  title: '',
                  isWidgetShow: true,
                  image: ImageUtils.basicIcon,
                  isShowEditIcon: true,
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
              ),
              Padding(
                padding: const EdgeInsets.all(Constant.maximumPadding),
                child: OptionCardView(
                  title: '',
                  isWidgetShow: true,
                  image: ImageUtils.photoIcon,
                  isShowEditIcon: true,
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
                                  width: MediaQuery.of(context).size.width / 3 -
                                      20,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              ColorConstant.tinnyPrimaryColor),
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
              ),
              const SizedBox(
                height: Constant.maximumPadding + Constant.mediumPadding,
              ),
              ButtonView(),
              const SizedBox(
                height: Constant.maximumPadding +
                    Constant.maximumPadding +
                    Constant.maximumPadding,
              )
            ],
          )),
        ),
      ),
    );
  }
}
