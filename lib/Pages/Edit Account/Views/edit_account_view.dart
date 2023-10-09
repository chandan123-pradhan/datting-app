import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Pages/Edit%20Account/Widgets/edit_basic_widget.dart';
import 'package:dating_app/Pages/Edit%20Account/Widgets/edit_photos_widget.dart';
import 'package:dating_app/Pages/Register/Widgets/upload_photos_widget.dart';
import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/common_widgets/common_app_bar.dart';
import 'package:dating_app/screens/account/views/button_view.dart';
import 'package:dating_app/Pages/Edit%20Account/Widgets/edit_intrests_widget.dart';
import 'package:flutter/material.dart';
import '../../../screens/account/views/option_card_view.dart';

class EditAccountView extends StatefulWidget {
  const EditAccountView({super.key});

  @override
  State<EditAccountView> createState() => _EditAccountViewState();
}

class _EditAccountViewState extends State<EditAccountView> {
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
      backgroundColor: ThemeConfiguration.scaffoldBgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: CommonAppBar(
          title: StringConstants.editProfile,
          onEdit: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EditAccountView()),
            );
          },
          onSetting: () {},
          editShow: false,
          settingShow: false,
          isBack: true,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: SizeConstants.profileAvatarRadius,
                    backgroundColor: ThemeConfiguration.cardShadowColor,
                  ),
                  const Positioned(
                      right: 0.0,
                      bottom: 5.0,
                      child: CircleAvatar(
                        radius: SizeConstants.profileAvatarEditRadius,
                        backgroundImage:
                            AssetImage(ImageConstants.profilePicEditButton),
                      ))
                ],
              ),
              const SizedBox(
                height: SizeConstants.maximumPadding,
              ),
              const SizedBox(height: SizeConstants.maximumPadding),
              Padding(
                  padding: const EdgeInsets.fromLTRB(
                      SizeConstants.maximumPadding,
                      SizeConstants.maximumPadding,
                      SizeConstants.maximumPadding,
                      0),
                  child: CommonWidgets.inputField(
                    context: context,
                    textFieldController: nameController,
                    hintText: StringConstants.editName,
                    textInputType: TextInputType.text,
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    SizeConstants.maximumPadding,
                    SizeConstants.maximumPadding,
                    SizeConstants.maximumPadding,
                    0),
                child: CommonWidgets.mobileNumberInputTextField(
                    context: context, textFieldController: phoneController),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    SizeConstants.maximumPadding,
                    SizeConstants.maximumPadding,
                    SizeConstants.maximumPadding,
                    0),
                child: CommonWidgets.inputField(
                  context: context,
                  textFieldController: bioController,
                  hintText: StringConstants.editBio,
                  textInputType: TextInputType.text,
                ),
              ),
              const SizedBox(
                height: SizeConstants.smallPadding,
              ),
              Padding(
                padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
                child: OptionCardView(
                  title: '',
                  isWidgetShow: true,
                  image: ImageConstants.heartIcon,
                  isShowEditIcon: true,
                  onEdit: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditInterestWidget()),
                    );
                  },
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        StringConstants.yourIntrest,
                        style: TextStyle(
                            color: ThemeConfiguration.descriptiveColor),
                      ),
                      const SizedBox(
                        height: SizeConstants.mediumPadding,
                      ),
    GridView.builder(
                    itemCount: options.length,
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
                              options[index],
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
              ),
              Padding(
                padding: const EdgeInsets.all(SizeConstants.maximumPadding),
                child: OptionCardView(
                  title: '',
                  isWidgetShow: true,
                  image: ImageConstants.basicIcon,
                  isShowEditIcon: true,
                  onEdit: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditBasicWidget()),
                    );
                  },
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        StringConstants.myBasic,
                        style: TextStyle(
                            color: ThemeConfiguration.descriptiveColor),
                      ),
                      const SizedBox(
                        height: SizeConstants.mediumPadding,
                      ),
                      GridView.builder(
                    itemCount: myBasics.length,
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
                              myBasics[index],
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
              ),
              Padding(
                padding: const EdgeInsets.all(SizeConstants.maximumPadding),
                child: OptionCardView(
                  title: '',
                  isWidgetShow: true,
                  image: ImageConstants.photoIcon,
                  isShowEditIcon: true,
                  onEdit: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditPhotosWidget()),
                    );
                  },
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        StringConstants.photos,
                        style: TextStyle(
                            color: ThemeConfiguration.descriptiveColor),
                      ),
                      const SizedBox(
                        height: SizeConstants.mediumPadding,
                      ),
                     Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                        decoration: BoxDecoration(
                              border: Border.all(
                                  color: ThemeConfiguration.primaryLightColor),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: InkWell(
                              child: Image.asset(ImageConstants.galleryAddIcon),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: SizeConstants.mediumPadding,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width / 4.3,
                            width: MediaQuery.of(context).size.width / 4.3,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        ThemeConfiguration.primaryLightColor),
                                borderRadius: BorderRadius.circular(15)),
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
                            height: SizeConstants.mediumPadding,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.width / 4.3,
                            width: MediaQuery.of(context).size.width / 4.3,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        ThemeConfiguration.primaryLightColor),
                                borderRadius: BorderRadius.circular(15)),
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
                        ],
                      )
                    ],
                  ),
                ],
                  ),
                ),
              ),
              const SizedBox(
                height:
                    SizeConstants.maximumPadding + SizeConstants.mediumPadding,
              ),
              Image.asset(
                ImageConstants.saveBtn,
                height: SizeConstants.buttonHeight,
                width: MediaQuery.of(context).size.width / 1,
              ),
              const SizedBox(
                height: SizeConstants.maximumPadding +
                    SizeConstants.maximumPadding +
                    SizeConstants.maximumPadding,
              )
            ],
          )),
        ),
      ),
    );
  }
}
