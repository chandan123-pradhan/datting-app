import 'package:dating_app/Models/base_model.dart';
import 'package:dating_app/Network/api_provider.dart';
import 'package:flutter/foundation.dart';

abstract class LoginRepository {
  Future<BaseModel?> requestOtp({int? mobileNumber});
}

class LoginRepositoryImp extends LoginRepository {
  @override
  Future<BaseModel?> requestOtp({int? mobileNumber}) async {
    BaseModel? baseModel;
    try {
      baseModel =
      await ApiProvider().requestOtp(mobileNumber: mobileNumber);
      return baseModel;
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return baseModel;
  }

}
