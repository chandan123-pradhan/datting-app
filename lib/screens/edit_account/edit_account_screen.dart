import 'package:dating_app/common_widgets/common_app_bar.dart';
import 'package:dating_app/screens/account/views/profile_body_card.dart';
import 'package:dating_app/screens/account/views/profile_card_view.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/constants.dart';
import 'package:dating_app/utils/image_utils.dart';
import 'package:dating_app/utils/string_utils.dart';
import 'package:dating_app/widgets/text_field_widgets.dart';
import 'package:flutter/material.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Constant.mainPagePadding),
          child: SingleChildScrollView(
              child: Column(
            children: [
              CommonAppBar(
                title: StringUtils.editProfile,
                onEdit: () {},
                onSetting: () {},
              ),

              SizedBox(height: Constant.maximumPadding),
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
                        backgroundColor: ColorConstant.profileContainerBgColor,
                        child: const Icon(
                          Icons.edit_outlined,
                          size: 20,
                          color: ColorConstant.descriptiveColor,
                        ),
                      ))
                ],
              ),

              SizedBox(height: Constant.maximumPadding),
              Padding(
                  padding: const EdgeInsets.fromLTRB(Constant.maximumPadding,
                      Constant.maximumPadding, Constant.maximumPadding, 0),
                  child: TextFieldWidgets.inputField(
                    context: context,
                    textFieldController: nameController,
                    hintText: '',
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
                  hintText: '',
                  textInputType: TextInputType.text,
                ),
              ),
              // ProfileBodyCard(isFromEdit: true,),
              SizedBox(
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
