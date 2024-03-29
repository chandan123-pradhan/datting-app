import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Helper/toast_helper.dart';
import 'package:dating_app/Pages/Register/Bloc/register_bloc.dart';
import 'package:dating_app/Pages/Register/Bloc/register_event.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/utils/image_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class UploadPhotosWidget extends StatefulWidget {
  final RegisterBloc? registerBloc;
  final Function(List<String>)? imageUploaded;
   UploadPhotosWidget({super.key, this.registerBloc,this.imageUploaded});

  @override
  _UploadPhotosWidgetState createState() => _UploadPhotosWidgetState();
}

class _UploadPhotosWidgetState extends State<UploadPhotosWidget> {
  final List<String> imageUrls = [];
  final picker = ImagePicker();

  Future<void> _pickImage(String? fileType) async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      ToastHelper().showErrorMsg(
          context: context, message: StringConstants.photoValidationMsg);
    } else {
      if (kDebugMode) {
        print(pickedFile.name);
      }
      final File imageFile = File(pickedFile.path);
      widget.registerBloc?.add(RegisterPhotoEvent(imageFile, fileType));
      setState(() {
        imageUrls.add(pickedFile.path);
      });
      widget.imageUploaded!(imageUrls);
    }
  }

  Future<void> _takePhoto() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        imageUrls.add(pickedFile.path);
      });
    }
  }

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
                          child: imageUrls.isNotEmpty
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      SizeConstants.mainPagePadding - 1),
                                  child: Image.file(
                                    File(imageUrls[0]),
                                    fit: BoxFit.cover,
                                  ))
                              : InkWell(
                                  onTap: () {
                                    _pickImage("main");
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        SizeConstants.mainPagePadding),
                                    child:
                                        Image.asset(ImageUtils.galleryAddIcon),
                                  )),
                        ),
                        Positioned(
                            bottom: SizeConstants.mainPagePadding,
                            right: SizeConstants.mainPagePadding,
                            left: SizeConstants.mainPagePadding,
                            child: Image.asset(
                              ImageUtils.changePhotoButton,
                              height: 32,
                              width: 127,
                            )),
                        Positioned(
                            top: SizeConstants.smallPadding,
                            right: SizeConstants.smallPadding +
                                SizeConstants.mainPagePadding,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  imageUrls.removeAt(0);
                                });
                              },
                              child: const Icon(
                                Icons.cancel,
                                color: ThemeConfiguration.buttonColor,
                              ),
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
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: SizeConstants.mainPagePadding,
                                      top: SizeConstants.mainPagePadding),
                                  child: Container(
                                    height: MediaQuery.of(context).size.width /
                                            3.8 -
                                        SizeConstants.mainPagePadding,
                                    width: MediaQuery.of(context).size.width /
                                            3.8 -
                                        SizeConstants.mainPagePadding,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ThemeConfiguration
                                                .primaryLightColor),
                                        borderRadius: BorderRadius.circular(
                                            SizeConstants.mainPagePadding)),
                                    child: imageUrls.length > i + 1
                                        ? ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                SizeConstants.mainPagePadding -
                                                    1),
                                            child: Image.file(
                                              File(imageUrls[0 + i + 1]),
                                              fit: BoxFit.cover,
                                            ))
                                        : InkWell(
                                            onTap: () {
                                              _pickImage("other");
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(35.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        SizeConstants
                                                            .mainPagePadding),
                                                child: Image.asset(
                                                  ImageUtils.galleryAddIcon,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                                Positioned(
                                    top: SizeConstants.mainPagePadding +
                                        SizeConstants.altraSmallPadding,
                                    right: SizeConstants.altraSmallPadding,
                                    child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            imageUrls.removeAt(i);
                                          });
                                        },
                                        child: const Icon(
                                          Icons.cancel,
                                          color: ThemeConfiguration.buttonColor,
                                        )))
                              ],
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
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: SizeConstants.mainPagePadding,
                              right: 0.0),
                          child: Container(
                            height: MediaQuery.of(context).size.width / 3.4,
                            width: MediaQuery.of(context).size.width / 3.4,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        ThemeConfiguration.primaryLightColor),
                                borderRadius: BorderRadius.circular(
                                    SizeConstants.mainPagePadding)),
                            child: imageUrls.length > i + 1
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        SizeConstants.mainPagePadding - 1),
                                    child: Image.file(
                                      File(imageUrls[0 + i + 1]),
                                      fit: BoxFit.cover,
                                    ))
                                : InkWell(
                                    onTap: () {
                                      _pickImage("other");
                                    },
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
                        Positioned(
                            top: SizeConstants.altraSmallPadding,
                            right: SizeConstants.altraSmallPadding,
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    imageUrls.removeAt(i);
                                  });
                                },
                                child: const Icon(
                                  Icons.cancel,
                                  color: ThemeConfiguration.buttonColor,
                                )))
                      ],
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
