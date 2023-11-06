import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Helper/navigation_helper.dart';
import 'package:dating_app/Pages/InterestedInYou/controller/intrested_in_you_controller.dart';
import 'package:dating_app/Pages/InterestedInYou/models/intrested_in_you_api_response.dart';
import 'package:dating_app/Pages/ProfileDetail/View/profile_detail_view.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileCardWidget extends StatelessWidget {
  IntrestedPersonData intrestedPersonData;
   ProfileCardWidget({
    super.key,
    required this.intrestedPersonData
  });

var controller=Get.put(IntrestedInYouController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NavigationHelper.profileDetail);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(SizeConstants.normalCardBorderRadius),
               ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(SizeConstants.normalCardBorderRadius),
                child:
                
                CachedNetworkImage(
  imageUrl:controller.intrestedInYouApiResponse!.imgUrl+intrestedPersonData.actionDoneTo.image,
  imageBuilder: (context, imageProvider) => Container(
    decoration: BoxDecoration(
      image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        //  colorFilter:
              ),
    ),
  ),
  placeholder: (context, url) =>  Container(
    decoration: BoxDecoration(
      border: Border.all(width: 1,color: Colors.black26),
      borderRadius: BorderRadius.circular(10)
,    ),
 child: Icon(Icons.image,size:25),
  ),
  errorWidget: (context, url, error) =>Container(
    decoration: BoxDecoration(
      border: Border.all(width: 1,color: Colors.black26),
      borderRadius: BorderRadius.circular(10)
,    ),
 child: Icon(Icons.image,size:40),
  ),
),
                
               ),
          ),
          Padding(
              padding: const EdgeInsets.all(
                  SizeConstants.mainContainerContentPadding),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                 intrestedPersonData.actionDoneBy.fullName,
                  style: ThemeConfiguration.commonTextStyle(
                    13.0,
                    FontWeight.w700,
                    ThemeConfiguration.commonAppBarBgColor,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
