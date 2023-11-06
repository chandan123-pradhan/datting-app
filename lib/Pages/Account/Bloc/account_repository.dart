import 'package:dating_app/Models/userdata_model.dart';
import 'package:dating_app/Network/api_provider.dart';
import 'package:dating_app/Pages/Register/Model/interest_response_model.dart';
import 'package:flutter/foundation.dart';

abstract class AccountRepository {
  Future<UserDataModel?> getAccountData();
  Future<InterestResponseModel?> getInterestList();
}

class AccountRepositoryImp extends AccountRepository {
  @override
  Future<UserDataModel?> getAccountData() async {
    UserDataModel? registerMobileNumberModel;
    try {
      registerMobileNumberModel =
      await ApiProvider().getUserProfile();
      return registerMobileNumberModel;
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return registerMobileNumberModel;
  }

  @override
  Future<InterestResponseModel?> getInterestList() async {
    InterestResponseModel? interestResponseModel;
    try {
      return interestResponseModel = await ApiProvider().getInterestList();
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return interestResponseModel;
  }

  
}
