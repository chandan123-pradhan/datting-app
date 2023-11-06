import 'dart:developer';
import 'dart:io';

import 'package:dating_app/Models/base_model.dart';
import 'package:dating_app/Models/register_mobilenumber_model.dart';
import 'package:dating_app/Models/userdata_model.dart';
import 'package:dating_app/Network/api_provider.dart';
import 'package:dating_app/Pages/Register/Model/interest_response_model.dart';
import 'package:flutter/foundation.dart';

abstract class RegisterRepository {
  Future<BaseModel?> requestOtp({int? mobileNumber});
  Future<RegisterMobileNumberModel?> verifyOtp({int? mobileNumber, int? otp});
  Future<UserDataModel?> registerFullName({String? fullName});
  Future<UserDataModel?> registerDob({String? dob});
  Future<UserDataModel?> registerGender({String? gender});
  Future<UserDataModel?> registerAbout({String? about});
  Future<UserDataModel?> registerAboutJob({String? job});
  Future<InterestResponseModel?> getInterestList();
  Future<UserDataModel?> registerInterest({String? interest});
  Future<UserDataModel?> registerPhoto({File? photo, String? fileType});
  Future<UserDataModel?> verifyReferralCode({String? referralCode});
}

class RegisterRepositoryImp extends RegisterRepository {
  @override
  Future<BaseModel?> requestOtp({int? mobileNumber}) async {
    BaseModel? baseModel;
    try {
      baseModel =
          await ApiProvider().requestOtpForRegister(mobileNumber: mobileNumber);
      return baseModel;
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return baseModel;
  }

  @override
  Future<RegisterMobileNumberModel?> verifyOtp(
      {int? mobileNumber, int? otp}) async {
    RegisterMobileNumberModel? registerMobileNumberModel;
    try {
      registerMobileNumberModel =
          await ApiProvider().otpVerify(mobileNumber: mobileNumber, otp: otp);
      return registerMobileNumberModel;
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return registerMobileNumberModel;
  }

  @override
  Future<UserDataModel?> registerFullName({String? fullName}) async {
    UserDataModel? userDataModel;
    try {
      return userDataModel =
          await ApiProvider().registerFullName(fullName: fullName);
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return userDataModel;
  }



  @override
  Future<UserDataModel?> verifyReferralCode({String? referralCode}) async {
    UserDataModel? userDataModel;
    try {
      return userDataModel =
      await ApiProvider().checkoutReferralCode(code: referralCode);
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return userDataModel;
  }


  @override
  Future<UserDataModel?> registerDob({String? dob}) async {
    UserDataModel? userDataModel;
    try {
      return userDataModel = await ApiProvider().registerDob(dob: dob);
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return userDataModel;
  }

  @override
  Future<UserDataModel?> registerGender({String? gender}) async {
    UserDataModel? userDataModel;
    try {
      return userDataModel = await ApiProvider().registerGender(gender: gender);
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return userDataModel;
  }

  @override
  Future<UserDataModel?> registerAbout({String? about}) async {
    UserDataModel? userDataModel;
    try {
      return userDataModel = await ApiProvider().registerAbout(about: about);
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return userDataModel;
  }

  @override
  Future<UserDataModel?> registerAboutJob({String? job}) async {
    UserDataModel? userDataModel;
    try {
      return userDataModel = await ApiProvider().registerAboutJob(job: job);
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return userDataModel;
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

  @override
  Future<UserDataModel?> registerInterest({String? interest}) async {
    UserDataModel? userDataModel;
    try {
      return userDataModel =
          await ApiProvider().registerInterest(interest: interest);
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return userDataModel;
  }

  @override
  Future<UserDataModel?> registerPhoto({File? photo, String? fileType}) async {
    UserDataModel? userDataModel;
    try {
      
      return userDataModel =
      await ApiProvider().registerPhoto(photo: photo,fileType: fileType);
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return userDataModel;
  }
}
