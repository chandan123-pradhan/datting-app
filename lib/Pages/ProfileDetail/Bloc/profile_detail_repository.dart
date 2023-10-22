import 'package:dating_app/Models/userdata_model.dart';
import 'package:dating_app/Network/api_provider.dart';
import 'package:flutter/foundation.dart';

abstract class ProfileDetailRepository {
  Future<UserDataModel?> getProfileDetailData();
}

class ProfileDetailRepositoryImp extends ProfileDetailRepository {
  @override
  Future<UserDataModel?> getProfileDetailData() async {
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

}
