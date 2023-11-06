import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Helper/toast_helper.dart';
import 'package:dating_app/Pages/Register/Bloc/register_bloc.dart';
import 'package:dating_app/Pages/Register/Bloc/register_event.dart';
import 'package:dating_app/Utilities/dialogs.dart';
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
  UploadPhotosWidget({super.key, this.registerBloc, this.imageUploaded});

  @override
  _UploadPhotosWidgetState createState() => _UploadPhotosWidgetState();
}

class _UploadPhotosWidgetState extends State<UploadPhotosWidget> {
  final List<String> imageUrls = [];
  final picker = ImagePicker();
  final List<File> pickedImage = [];

  Future<void> _pickImage(String? fileType, source) async {
    final XFile? pickedFile = await picker.pickImage(source: source);
    if (pickedFile == null) {
      ToastHelper().showErrorMsg(
          context: context, message: StringConstants.photoValidationMsg);
    } else {
      if (kDebugMode) {
        print(pickedFile.name);
      }
      final File imageFile = File(pickedFile.path);
      pickedImage.add(imageFile);
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

        Expanded(
            child: GridView.builder(
          itemCount: pickedImage.length + 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              // height: MediaQuery.of(context).size.width / 3.8 -
              //     SizeConstants.mainPagePadding,
              // width: MediaQuery.of(context).size.width / 3.8 -
              //     SizeConstants.mainPagePadding,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: ThemeConfiguration.primaryLightColor),
                  borderRadius:
                      BorderRadius.circular(SizeConstants.mainPagePadding)),
              child: index < pickedImage.length
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(
                          SizeConstants.mainPagePadding - 1),
                      child: Image.file(
                        pickedImage[index],
                        fit: BoxFit.cover,
                      ))
                  : InkWell(
                      onTap: () {
                        _showImagePickerOptions(index);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(35.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              SizeConstants.mainPagePadding),
                          child: Image.asset(
                            ImageUtils.galleryAddIcon,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),

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

        //  Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [

        //     // Expanded(
        //     //   child:

        //     //   Column(
        //     //     children: [
        //     //       Stack(
        //     //         children: [
        //     //           Container(
        //     //             height: MediaQuery.of(context).size.width / 3.25 +
        //     //                 MediaQuery.of(context).size.width / 3.25 +
        //     //                 SizeConstants.bigPadding,
        //     //             width: MediaQuery.of(context).size.width / 1,
        //     //             margin: const EdgeInsets.symmetric(
        //     //               horizontal: SizeConstants.mainPagePadding,
        //     //             ),
        //     //             decoration: BoxDecoration(
        //     //                 border: Border.all(
        //     //                     color: ThemeConfiguration.primaryLightColor),
        //     //                 borderRadius: BorderRadius.circular(
        //     //                     SizeConstants.mainPagePadding)),
        //     //             child: imageUrls.isNotEmpty
        //     //                 ? ClipRRect(
        //     //                     borderRadius: BorderRadius.circular(
        //     //                         SizeConstants.mainPagePadding - 1),
        //     //                     child: Image.file(
        //     //                       File(imageUrls[0]),
        //     //                       fit: BoxFit.cover,
        //     //                     ))
        //     //                 : InkWell(
        //     //                     onTap: () {
        //     //                       _pickImage('main',ImageSource.camera);
        //     //   // Navigator.of(context).pop();
        //     //                     },
        //     //                     child: ClipRRect(
        //     //                       borderRadius: BorderRadius.circular(
        //     //                           SizeConstants.mainPagePadding),
        //     //                       child:
        //     //                           Image.asset(ImageUtils.galleryAddIcon),
        //     //                     )),
        //     //           ),
        //     //           Positioned(
        //     //               bottom: SizeConstants.mainPagePadding,
        //     //               right: SizeConstants.mainPagePadding,
        //     //               left: SizeConstants.mainPagePadding,
        //     //               child: Image.asset(
        //     //                 ImageUtils.changePhotoButton,
        //     //                 height: 32,
        //     //                 width: 127,
        //     //               )),
        //     //           Positioned(
        //     //               top: SizeConstants.smallPadding,
        //     //               right: SizeConstants.smallPadding +
        //     //                   SizeConstants.mainPagePadding,
        //     //               child: InkWell(
        //     //                 onTap: () {
        //     //                   setState(() {
        //     //                     imageUrls.removeAt(0);
        //     //                   });
        //     //                 },
        //     //                 child: const Icon(
        //     //                   Icons.cancel,
        //     //                   color: ThemeConfiguration.buttonColor,
        //     //                 ),
        //     //               ))
        //     //         ],
        //     //       ),
        //     //       Padding(
        //     //         padding: const EdgeInsets.only(
        //     //             right: SizeConstants.mainPagePadding),
        //     //         child: Row(
        //     //           mainAxisAlignment: MainAxisAlignment.end,
        //     //           children: [
        //     //             for (var i = 3; i < 5; i++)
        // Stack(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.only(
        //           left: SizeConstants.mainPagePadding,
        //           top: SizeConstants.mainPagePadding),
        //       child: Container(
        //         height: MediaQuery.of(context).size.width /
        //                 3.8 -
        //             SizeConstants.mainPagePadding,
        //         width: MediaQuery.of(context).size.width /
        //                 3.8 -
        //             SizeConstants.mainPagePadding,
        //         decoration: BoxDecoration(
        //             border: Border.all(
        //                 color: ThemeConfiguration
        //                     .primaryLightColor),
        //             borderRadius: BorderRadius.circular(
        //                 SizeConstants.mainPagePadding)),
        //         child: imageUrls.length > i + 1
        //             ? ClipRRect(
        //                 borderRadius: BorderRadius.circular(
        //                     SizeConstants.mainPagePadding -
        //                         1),
        //                 child: Image.file(
        //                   File(imageUrls[0 + i + 1]),
        //                   fit: BoxFit.cover,
        //                 ))
        //             : InkWell(
        //                 onTap: () {
        //                   _showImagePickerOptions("other");
        //                 },
        //                 child: Padding(
        //                   padding:
        //                       const EdgeInsets.all(35.0),
        //                   child: ClipRRect(
        //                     borderRadius:
        //                         BorderRadius.circular(
        //                             SizeConstants
        //                                 .mainPagePadding),
        //                     child: Image.asset(
        //                       ImageUtils.galleryAddIcon,
        //                       fit: BoxFit.fill,
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //       ),
        //     ),
        //     Positioned(
        //         top: SizeConstants.mainPagePadding +
        //             SizeConstants.altraSmallPadding,
        //         right: SizeConstants.altraSmallPadding,
        //         child: InkWell(
        //             onTap: () {
        //               setState(() {
        //                 imageUrls.removeAt(i);
        //               });
        //             },
        //             child: const Icon(
        //               Icons.cancel,
        //               color: ThemeConfiguration.buttonColor,
        //             )))
        //     //                 ],
        //     //               ),
        //     //           ],
        //     //         ),
        //     //       ),
        //     //     ],
        //     //   ),
        //     // ),

        //     // Column(
        //     //   children: [
        //     //     for (var i = 0; i < 3; i++)
        //     //      ],
        //     // ),

        //   ],
        // ),
      ],
    );
  }

  void _showImagePickerOptions(index) {
    if (index == 0) {
      Dialogs.showinfodialog(context, () {
         Navigator.pop(context);
        _pickImage('main', ImageSource.camera);
       
      });
    } else {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  _pickImage('other', ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  _pickImage('other', ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
