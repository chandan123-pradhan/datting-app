import 'dart:developer';

import 'package:dating_app/Network/api_provider.dart';
import 'package:dating_app/Pages/InterestedInYou/models/intrested_in_you_api_response.dart';
import 'package:get/get.dart';

class IntrestedInYouController extends GetxController{
  IntrestedInYouApiResponse? intrestedInYouApiResponse;
  void getIntrestedInYou(){
    Map params={

    };
    ApiProvider().getIntrestedInYou(
params
    ).then((value) {
      intrestedInYouApiResponse=value;
      update();
     // debugger();
    });
  }
}