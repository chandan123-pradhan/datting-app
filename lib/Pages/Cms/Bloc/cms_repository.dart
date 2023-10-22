import 'package:dating_app/Models/base_model.dart';
import 'package:dating_app/Models/register_mobilenumber_model.dart';
import 'package:dating_app/Network/api_provider.dart';
import 'package:flutter/foundation.dart';

abstract class CmsRepository {
  Future<RegisterMobileNumberModel?> getCmsData({String? apiName});
}

class CmsRepositoryImp extends CmsRepository {
  @override
  Future<RegisterMobileNumberModel?> getCmsData({String? apiName}) async {
    RegisterMobileNumberModel? registerMobileNumberModel;
    try {
      registerMobileNumberModel =
      await ApiProvider().getCmsData(apiEndPoint: apiName);
      return registerMobileNumberModel;
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return registerMobileNumberModel;
  }

}
