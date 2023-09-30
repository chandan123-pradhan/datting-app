import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/utils/image_utils.dart';
import 'package:dating_app/utils/string_utils.dart';
import 'package:dating_app/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class UploadPhotosWidget extends StatefulWidget {
  const UploadPhotosWidget({super.key});

  @override
  _UploadPhotosWidgetState createState() => _UploadPhotosWidgetState();
}

class _UploadPhotosWidgetState extends State<UploadPhotosWidget> {
  List<File> images = [];

  // Future<void> _pickImage() async {
  //   final imagePicker = ImagePicker();
  //   final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

  //   if (pickedFile != null) {
  //     setState(() {
  //       images.add(File(pickedFile.path));
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: SizeConstants.mediumPadding,
        ),
        Text(
          StringConstants.uploadYourphotos,
          style: ThemeConfiguration.registerHeadingTextStyle(),
        ),
        const SizedBox(
          height: SizeConstants.bigPadding,
        ),
        Padding(
          padding: const EdgeInsets.only(right: SizeConstants.mainPagePadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width / 3.25 +
                              MediaQuery.of(context).size.width / 3.25 +
                              SizeConstants.bigPadding,
                          width: MediaQuery.of(context).size.width / 1,
                          margin: const EdgeInsets.symmetric(
                            horizontal: SizeConstants.mainPagePadding,
                          ),
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
                                  child: Image.asset(ImageUtils.galleryAddIcon),
                                ),
                        ),
                        Positioned(
                            bottom: SizeConstants.mainPagePadding,
                            right: SizeConstants.mainPagePadding,
                            left: SizeConstants.mainPagePadding,
                            child: Image.asset(
                              ImageUtils.changePhotoButton,
                              height: 32,
                              width: 127,
                            ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: SizeConstants.mainPagePadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          for (var i = 3; i < 5; i++)
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: SizeConstants.mainPagePadding,
                                  top: SizeConstants.mainPagePadding),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.width / 3.8 -
                                        SizeConstants.mainPagePadding,
                                width: MediaQuery.of(context).size.width / 3.8 -
                                    SizeConstants.mainPagePadding,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ThemeConfiguration
                                            .primaryLightColor),
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
                                          padding: const EdgeInsets.all(35.0),
                                          child: Image.asset(
                                            ImageUtils.galleryAddIcon,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  for (var i = 0; i < 3; i++)
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: SizeConstants.mainPagePadding, right: 0.0),
                      child: Container(
                        height: MediaQuery.of(context).size.width / 3.4,
                        width: MediaQuery.of(context).size.width / 3.4,
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
                                    ImageUtils.galleryAddIcon,
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
        ),
      ],
    );
  }
}
