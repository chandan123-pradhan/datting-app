import 'package:dating_app/Models/base_model.dart';
import 'package:dating_app/Models/register_mobilenumber_model.dart';
import 'package:dating_app/Network/api_provider.dart';
import 'package:flutter/foundation.dart';

abstract class OtpRepository {
  Future<RegisterMobileNumberModel?> verifyOtp({int? mobileNumber,int? otp});
}

class OtpRepositoryImp extends OtpRepository {
  @override
  Future<RegisterMobileNumberModel?> verifyOtp({int? mobileNumber,int? otp}) async {
    RegisterMobileNumberModel? registerMobileNumberModel;
    try {
      registerMobileNumberModel =
      await ApiProvider().otpVerify(mobileNumber: mobileNumber,otp: otp);
      return registerMobileNumberModel;
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return registerMobileNumberModel;
  }

}
