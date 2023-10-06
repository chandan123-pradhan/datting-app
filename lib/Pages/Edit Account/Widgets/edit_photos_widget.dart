// ignore_for_file: library_private_types_in_public_api

import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Pages/Register/Widgets/upload_photos_widget.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/common_widgets/common_app_bar.dart';
import 'package:flutter/material.dart';

class EditPhotosWidget extends StatefulWidget {
  const EditPhotosWidget({super.key});

  @override
  _EditPhotosWidgetState createState() => _EditPhotosWidgetState();
}

class _EditPhotosWidgetState extends State<EditPhotosWidget> {
  List<String> options = [
    '👩‍🎓 Student',
    '👱🏻‍♀️ Women',
    '👤 183 cm',
    '🎵 Music',
    '🍀 Nature',
    '📸 Photography',
    '📚 Reading',
    '🏛️ Architecture',
    "✍🏻 Writing",
    "👗 Fashion",
    "🗣️ Language",
    "💪🏻 Gym & Fitness",
    "🐶 Animals"
  ];
  List<bool> selected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeConfiguration.scaffoldBgColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: CommonAppBar(
            title: '',
            onEdit: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => const EditAccountScreen()),
              // );
            },
            onSetting: () {},
            editShow: false,
            settingShow: false,
            isBack: true,
          ),
        ),
        body: Column(
          children: [
            UploadPhotosWidget(),
            const SizedBox(
              height: SizeConstants.aboutFieldHeight,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                ImageConstants.saveBtn,
                height: SizeConstants.buttonHeight,
                width: MediaQuery.of(context).size.width / 1,
              ),
            ),
          ],
        ));
  }
}
