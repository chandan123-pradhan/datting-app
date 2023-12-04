import 'dart:developer';

import 'package:dating_app/Helper/navigation_helper.dart';
import 'package:dating_app/Helper/toast_helper.dart';
import 'package:dating_app/Network/api_provider.dart';
import 'package:dating_app/Pages/Dashboard/controllers/dashboard_controllers.dart';
import 'package:dating_app/Pages/Map/Model/get_other_user_model.dart';
import 'package:dating_app/Pages/YourMatches/Bloc/wallet_bloc.dart';
import 'package:dating_app/Pages/YourMatches/View/wallet_view.dart';
import 'package:dating_app/Utilities/dialogs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetOtherUserProfileController extends GetxController {
  GetOthersUserProfileApiResponse? getOtherUserProfileResponse;
  var walletcontroller = Get.put(WalletController());

  void getOtherUserProfile(String id, context) async {
    // isLiked=false;
    //  debugger();
    try {
      var v = await ApiProvider().getOthersUserProfile(id: id);
      //  debugger();
      getOtherUserProfileResponse = v;
      isLiked = getOtherUserProfileResponse!.isLiked;
      update();
      // debugger();
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
  }

  void callCoinsDeductionDialog(id, context, entryFee) {
    String availableCoins =
        walletcontroller.getWalletDetailsApiResponse!.data.walletBalance;

    if (double.parse(availableCoins) < double.parse(entryFee)) {
      Dialogs.insufficientBalanceDialog(context, availableCoins, entryFee, () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const WalletView();
        }));
      });
    } else {
      Dialogs.coinsDeductionDialog(context, availableCoins, entryFee, () {
        Navigator.pop(context);
        likeUser(id, context);
      });
    }
  }

  bool isLiked = false;
  void likeUser(String id, context) async {
    //  debugger();
    try {
      var v = await ApiProvider().likeUser(id: id);

      isLiked = true;
      update();
      //ToastHelper().showMsg(context: context, message: v['message']);
      //  debugger();
      getOtherUserProfile(id, context);
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
  }

  bool isAccepted = false;
  void acceptOrReject(String id, status, context) async {
    //  debugger();
    
    try {
      Map params = {'connectionId': id, 'status': status};
      debugger();
      var v = await ApiProvider().acceptOrReject(params: params);
      ToastHelper().showMsg(context: context, message: v['message']);
      if (v['status'] == true) {



        Navigator.pop(context);
        
      }
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
  }
}
