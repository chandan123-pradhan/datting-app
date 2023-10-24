import 'package:dating_app/Models/base_model.dart';
import 'package:dating_app/Models/register_mobilenumber_model.dart';
import 'package:dating_app/Network/api_provider.dart';
import 'package:dating_app/Pages/Cms/Model/cms_response_model.dart';
import 'package:flutter/foundation.dart';

abstract class CmsRepository {
  Future<CmsResponseModel?> getCmsData({String? apiName});
}

class CmsRepositoryImp extends CmsRepository {
  @override
  Future<CmsResponseModel?> getCmsData({String? apiName}) async {
    CmsResponseModel? cmsResponseModel;
    try {
      cmsResponseModel =
      await ApiProvider().getCmsData(apiEndPoint: apiName);
      return cmsResponseModel;
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return cmsResponseModel;
  }

}
