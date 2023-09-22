import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/image_utils.dart';
import 'package:dating_app/utils/string_utils.dart';
import 'package:dating_app/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class UploadPhotosPage extends StatefulWidget {
  @override
  _UploadPhotosPageState createState() => _UploadPhotosPageState();
}

class _UploadPhotosPageState extends State<UploadPhotosPage> {
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
        TextWidgets.h2Tag(text: StringUtils.uploadYourPhotos),
        const SizedBox(
          height: 30,
        ),
Padding(
  padding: const EdgeInsets.only(right:15.0),
  child:   Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width/3.4+MediaQuery.of(context).size.width/3.4+15+11,
                  width:  MediaQuery.of(context).size.width/1,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15.0,
    ),
                  decoration: BoxDecoration(
                          border: Border.all(color: ColorConstant.tinnyPrimaryColor),
                          borderRadius: BorderRadius.circular(15)
                         ),
                  child: images.isNotEmpty
                      ? Image.file(
                          images.first,
                          fit: BoxFit.cover,
                        )
                      :  InkWell(
                          // onTap: _pickImage,
                          child: Image.asset(ImageUtils.galleryAddIcon),
                        ),
                ),
            Positioned(bottom:15,right: 15,left:15,child:Image.asset(ImageUtils.changePhotoButton,height: 32,width: 127,))  ],
            ),
        Padding(
          padding: const EdgeInsets.only(right:15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              for (var i = 3; i < 5; i++)
                Padding(
                  padding: const EdgeInsets.only(left:15.0,top: 15.0),
                  child: Container(
                    height: MediaQuery.of(context).size.width/3.4-8,
                    width: MediaQuery.of(context).size.width/3.4-8,
                 decoration: BoxDecoration(
                      border: Border.all(color: ColorConstant.tinnyPrimaryColor),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: images.length > i + 1
                        ? Image.file(
                            images[i + 1],
                            fit: BoxFit.cover,
                          )
                        :                       InkWell(
                      // onTap: _pickImage,
                      child: Padding(
                        padding: const EdgeInsets.all(35.0),
                        child: Image.asset(ImageUtils.galleryAddIcon,fit: BoxFit.fill,),
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
  
              padding: const EdgeInsets.only(bottom:15.0,right:0.0),
              child: Container(
                height: MediaQuery.of(context).size.width/3.4,
                width: MediaQuery.of(context).size.width/3.4,
    decoration: BoxDecoration(
                      border: Border.all(color: ColorConstant.tinnyPrimaryColor),
                      borderRadius: BorderRadius.circular(15)
                     ),
                child: images.length > i + 1
                    ? Image.file(
                        images[i + 1],
                        fit: BoxFit.cover,
                      )
                    :   InkWell(
                      // onTap: _pickImage,
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Image.asset(ImageUtils.galleryAddIcon,fit: BoxFit.fill,),
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
