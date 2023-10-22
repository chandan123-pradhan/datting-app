import 'dart:convert';
import 'package:dating_app/Helper/shared_preference_helper.dart';
import 'package:dating_app/Models/base_model.dart';
import 'package:dating_app/Models/register_mobilenumber_model.dart';
import 'package:dating_app/Models/userdata_model.dart';
import 'package:dating_app/Network/api_urls.dart';
import 'package:dating_app/Pages/Register/Model/interest_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiProvider {

  ///Login

  Future<BaseModel?> requestOtp({int? mobileNumber}) async {
    BaseModel baseModel;
    try {
      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.loginEndPoint),
        body: {
          ApiUrls.mobileNumber: mobileNumber.toString(),
        },
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.loginEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      baseModel = BaseModel.fromJson(jsonMap);
      return baseModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }

  Future<RegisterMobileNumberModel?> otpVerify({int? mobileNumber, int? otp}) async {
    RegisterMobileNumberModel registerMobileNumberModel;
    try {
      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.otpVerifyEndPoint),
        body: {
          ApiUrls.mobileNumber: mobileNumber.toString(),
          ApiUrls.otp: otp.toString(),
        },
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.otpVerifyEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      registerMobileNumberModel = RegisterMobileNumberModel.fromJson(jsonMap);
      return registerMobileNumberModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }


  ///ForgotPassword

  Future<BaseModel?> forgotPassword({String? email}) async {
    BaseModel baseModel;
    try {
      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.forgotPasswordEndPoint),
        body: {
          ApiUrls.email: email,
        },
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.forgotPasswordEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      baseModel = BaseModel.fromJson(jsonMap);
      return baseModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }

  Future<BaseModel?> resetPassword({String? email,String? forgotPasswordOtp, String? newPassword}) async {
    BaseModel baseModel;
    try {
      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.resetPasswordEndPoint),
        body: {
          ApiUrls.email: email,
          ApiUrls.forgotPasswordOtp: forgotPasswordOtp,
          ApiUrls.newPassword: newPassword,
        },
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.resetPasswordEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      baseModel = BaseModel.fromJson(jsonMap);
      return baseModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }



  ///Register

  Future<BaseModel?> requestOtpForRegister({int? mobileNumber}) async {
    BaseModel baseModel;
    try {
      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.registerNumberEndPoint),
        body: {
          ApiUrls.mobileNumber: mobileNumber.toString(),
        },
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.registerNumberEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      baseModel = BaseModel.fromJson(jsonMap);
      return baseModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }

  Future<UserDataModel?> registerFullName({String? fullName}) async {
    UserDataModel userDataModel;
    try {
    var  authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.registerFullNameEndPoint),
        body: {
          ApiUrls.fullName: fullName,
        },
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.registerFullNameEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = UserDataModel.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }

  Future<UserDataModel?> registerDob({String? dob}) async {
    UserDataModel userDataModel;
    try {
      var  authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.registerDobEndPoint),
        body: {
          ApiUrls.dob: dob,
        },
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.registerDobEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = UserDataModel.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }

  Future<UserDataModel?> registerGender({String? gender}) async {
    UserDataModel userDataModel;
    try {
      var  authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.registerGenderEndPoint),
        body: {
          ApiUrls.gender: gender,
        },
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.registerGenderEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = UserDataModel.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }

  Future<UserDataModel?> registerAbout({String? about}) async {
    UserDataModel userDataModel;
    try {
      var  authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.registerAboutEndPoint),
        body: {
          ApiUrls.about: about,
        },
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.registerAboutEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = UserDataModel.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }

  Future<UserDataModel?> registerAboutJob({String? job}) async {
    UserDataModel userDataModel;
    try {
      var  authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.registerAboutJobEndPoint),
        body: {
          ApiUrls.job: job,
        },
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.registerAboutJobEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = UserDataModel.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }

  Future<InterestResponseModel?> getInterestList() async {
    InterestResponseModel interestResponseModel;
    try {
      var  authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.getInterestList),
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.getInterestList}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      interestResponseModel = InterestResponseModel?.fromJson(jsonMap);
      return interestResponseModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }

  Future<UserDataModel?> registerInterest({List? interest}) async {
    UserDataModel userDataModel;
    try {
      var  authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.registerInterestEndPoint),
        body: {
          ApiUrls.interest: interest,
        },
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.registerInterestEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = UserDataModel.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }


  ///Profile


Future<UserDataModel?> getUserProfile({List? interest}) async {
  UserDataModel userDataModel;
  try {
    var  authToken = await SharedPreferencesHelper.getToken();
    final Map<String, String> headers = {
      'Authorization': 'Bearer $authToken',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    dynamic response = await http.post(
      Uri.parse(ApiUrls.baseUrl + ApiUrls.registerInterestEndPoint),
      body: {
        ApiUrls.interest: interest,
      },
      headers: headers,
    );

    if (kDebugMode) {
      print('URL: ${ApiUrls.baseUrl + ApiUrls.registerInterestEndPoint}');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
    final Map<String, dynamic> jsonMap = json.decode(response.body);
    userDataModel = UserDataModel.fromJson(jsonMap);
    return userDataModel;
  } catch (error, stacktrace) {
    if (kDebugMode) {
      print("Exception occurred: $error stackTrace: $stacktrace");
    }
    debugPrint(error.toString());
  }
}

  Future<UserDataModel?> updateUserProfile({String? firstName,String? lastName,String? email,String? address,String? interest,String? about, String? notficiation}) async {
    UserDataModel userDataModel;
    try {
      var  authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.userProfileUpdateEndPoint),
        body: {
          ApiUrls.firstName: firstName,
          ApiUrls.lastName: lastName,
          ApiUrls.email: email,
          ApiUrls.address: address,
          ApiUrls.interest: interest,
          ApiUrls.about: about,
          ApiUrls.notification: notficiation,
        },
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.userProfileUpdateEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = UserDataModel.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }


  Future<UserDataModel?> getSettings() async {
    UserDataModel userDataModel;
    try {
      var  authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.getSettingListEndPoint),
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.getSettingListEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = UserDataModel.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }

  ///Cms

  Future<RegisterMobileNumberModel?> getCmsData({String? apiEndPoint}) async {
    RegisterMobileNumberModel userDataModel;
    try {
      var  authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + (apiEndPoint??'')),
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + (apiEndPoint??'')}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = RegisterMobileNumberModel.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }



  ///Ads

  Future<UserDataModel?> getAdsList() async {
    UserDataModel userDataModel;
    try {
      var  authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.getAdListEndPoint),
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.getAdListEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = UserDataModel.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }

  Future<UserDataModel?> getAdsDetails({String? recordId}) async {
    UserDataModel userDataModel;
    try {
      var  authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.getAdDetailEndPoint),
        body: {
          ApiUrls.recordId: recordId,
        },
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.getAdDetailEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = UserDataModel.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }


  Future<UserDataModel?> viewAds({String? adRecordId}) async {
    UserDataModel userDataModel;
    try {
      var  authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.viewAdsEndPoint),
        body: {
          ApiUrls.adRecordId: adRecordId,
        },
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.viewAdsEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = UserDataModel.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }



  ///Wallet

  Future<UserDataModel?> addMoneyToWallet({int? amount,String? source}) async {
    UserDataModel userDataModel;
    try {
      var  authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.addMoneyToWalletEndPoint),
        body: {
          ApiUrls.amount: amount,
          ApiUrls.source:source,
        },
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.addMoneyToWalletEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = UserDataModel.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }


  Future<UserDataModel?> debitMoneyFromWallet({int? amount,String? source,String? note}) async {
    UserDataModel userDataModel;
    try {
      var  authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.debitMoneyFromWalletEndPoint),
        body: {
          ApiUrls.amount: amount,
          ApiUrls.source:source,
          ApiUrls.note:note,
        },
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.debitMoneyFromWalletEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = UserDataModel.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }


  Future<UserDataModel?> getUserWalletDetails({String? filterDate}) async {
    UserDataModel userDataModel;
    try {
      var  authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.getUserWalletDetailsEndPoint),
        body: {
          ApiUrls.filterDate: filterDate,
        },
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.getUserWalletDetailsEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = UserDataModel.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }


  Future<UserDataModel?> getWithdrawalRequestList() async {
    UserDataModel userDataModel;
    try {
      var  authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.withdrawalRequestListEndPoint),
        body: {
          // ApiUrls.filterDate: filterDate,
        },
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.withdrawalRequestListEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = UserDataModel.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }

  Future<UserDataModel?> withdrawalRequestGenerate({int? amount,String? withDrawalType,int? upiId,int? accountNumber,int? ifscCode,String? accountName}) async {
    UserDataModel userDataModel;
    try {
      var  authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.withdrawalRequestGenerateEndPoint),
        body: {
          ApiUrls.amount: amount,
          ApiUrls.withdrawalType:withDrawalType,
          ApiUrls.upiId:upiId,
          ApiUrls.accountNumber:accountNumber,
          ApiUrls.ifscCode:ifscCode,
          ApiUrls.accountName:accountName,
        },
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.withdrawalRequestGenerateEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = UserDataModel.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }


  ///Coins

  Future<UserDataModel?> orderWithRazorpay({int? amount}) async {
    UserDataModel userDataModel;
    try {
      var  authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.orderWithRazorpayEndPoint),
        body: {
          ApiUrls.amount: amount,
        },
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.orderWithRazorpayEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = UserDataModel.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }
  Future<UserDataModel?> checkoutWithRazorpay({int? orderId,paymentData,String? status}) async {
    UserDataModel userDataModel;
    try {
      var  authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.checkoutWithRazorpayEndPoint),
        body: {
          ApiUrls.orderId: orderId,
          ApiUrls.paymentData:paymentData,
          ApiUrls.status:status,
        },
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.checkoutWithRazorpayEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = UserDataModel.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }

  ///Others

  Future<UserDataModel?> checkoutReferralCode({String? code}) async {
    UserDataModel userDataModel;
    try {
      var  authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.checkReferralCodeEndPoint),
        body: {
          ApiUrls.userReferralCode: code,
        },
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.checkReferralCodeEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = UserDataModel.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }



}
