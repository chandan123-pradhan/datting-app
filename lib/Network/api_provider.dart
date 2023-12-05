import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dating_app/Helper/shared_preference_helper.dart';
import 'package:dating_app/Models/base_model.dart';
import 'package:dating_app/Models/register_mobilenumber_model.dart';
import 'package:dating_app/Models/userdata_model.dart';
import 'package:dating_app/Network/api_urls.dart';
import 'package:dating_app/Pages/Cms/Model/cms_response_model.dart';
import 'package:dating_app/Pages/InterestedInYou/models/intrested_in_you_api_response.dart';
import 'package:dating_app/Pages/Map/Model/get_other_user_model.dart';
import 'package:dating_app/Pages/Map/Model/nearest_user_list_model.dart';
import 'package:dating_app/Pages/Messages/models/get_message_list_api_response.dart';
import 'package:dating_app/Pages/Register/Model/interest_response_model.dart';
import 'package:dating_app/Pages/Settings/Model/setting_response_model.dart';
import 'package:dating_app/Pages/YourMatches/Model/add_money_to_wallet.dart';
import 'package:dating_app/Pages/YourMatches/Model/get_wallet_api_response.dart';
import 'package:dating_app/Pages/YourMatches/Model/order_with_razorpaymnet_api_response.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

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
      debugger();
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }

  Future<RegisterMobileNumberModel?> otpVerify(
      {int? mobileNumber, int? otp}) async {
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

  Future<BaseModel?> resetPassword(
      {String? email, String? forgotPasswordOtp, String? newPassword}) async {
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

  Future<UserDataModel?> checkoutReferralCode({String? code}) async {
    UserDataModel userDataModel;
    try {
      var authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.verifyReferralCodeEndPoint),
        body: {
          ApiUrls.userReferralCode: code,
        },
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.verifyReferralCodeEndPoint}');
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

  Future<UserDataModel?> registerFullName({String? fullName}) async {
    UserDataModel userDataModel;
    try {
      var authToken = await SharedPreferencesHelper.getToken();
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
      var authToken = await SharedPreferencesHelper.getToken();
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
      var authToken = await SharedPreferencesHelper.getToken();
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
      var authToken = await SharedPreferencesHelper.getToken();
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
      var authToken = await SharedPreferencesHelper.getToken();
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
      var authToken = await SharedPreferencesHelper.getToken();
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


  Future<dynamic?> updateUserLocation(params) async {
    dynamic interestResponseModel;
    try {
      var authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };
// debugger();
      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.updateUserLocation),
        headers: headers,
        body: params
      );
      
//  debugger();
      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.getInterestList}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
     
      final Map<String, dynamic> jsonMap = json.decode(response.body);
     
      return jsonMap;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }

  Future<UserDataModel?> registerInterest({String? interest}) async {
    UserDataModel userDataModel;
    try {
      var authToken = await SharedPreferencesHelper.getToken();
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



Future<GetOthersUserProfileApiResponse?> getOthersUserProfile({String? id}) async {
    GetOthersUserProfileApiResponse userDataModel;
    try {
      var authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.getOtherUserProfile),
        body: {
          'userId': id,
        },
        headers: headers,
      );
// debugger();
      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.getOtherUserProfile}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = GetOthersUserProfileApiResponse.fromJson(jsonMap);
      //debugger();
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }



Future<dynamic> likeUser({String? id}) async {
    dynamic userDataModel;
    try {
      var authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.likeUser),
        body: {
          'action_done_to': id,
        },
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.getOtherUserProfile}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
     
      return jsonMap;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }

  Future<dynamic> acceptOrReject({params}) async {
    dynamic userDataModel;
    try {
      var authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.acceptOrReject),
        body: params,
        headers: headers,
      );
    //  debugger();

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.acceptOrReject}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
     
      return jsonMap;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }

  Future<UserDataModel?> registerPhoto({File? photo, String? fileType}) async {
    UserDataModel? userDataModel;
    try {
      var authToken = await SharedPreferencesHelper.getToken();

      final Uri url = Uri.parse(ApiUrls.baseUrl + ApiUrls.uploadImagesEndPoint);

      var request = http.MultipartRequest('POST', url);
      request.headers['Authorization'] = 'Bearer $authToken';
      request.fields[ApiUrls.imageType] = fileType ?? '';
// debugger();
      if (photo != null) {
        String fileName = path.basename(photo.path);
        request.files.add(
          http.MultipartFile(
            ApiUrls.image,
            photo.readAsBytes().asStream(),
            photo.lengthSync(),
            filename: fileName,
          ),
        );
      }
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
//  debugger();
      if (kDebugMode) {
        print('URL: $url');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }

      if (response.statusCode == 201) {
        final Map<String, dynamic> jsonMap = json.decode(response.body);
        userDataModel = UserDataModel.fromJson(jsonMap);
        return userDataModel;
      } else {
        debugPrint('Request failed with status: ${response.statusCode}');
      }
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }

    return null;
  }

  ///Profile

  Future<UserDataModel?> getUserProfile() async {
    UserDataModel userDataModel;
    try {
      var authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.get(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.getUserProfileEndPoint),
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.getUserProfileEndPoint}');
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

  Future<UserDataModel?> updateUserProfile(
      {String? firstName,
      String? lastName,
      String? email,
      String? address,
      String? interest,
      String? about,
      String? notficiation}) async {
    UserDataModel userDataModel;
    try {
      var authToken = await SharedPreferencesHelper.getToken();
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

  Future<SettingResponseModel?> getSettings() async {
    SettingResponseModel settingResponseModel;
    try {
      var authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.get(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.getSettingListEndPoint),
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.getSettingListEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      settingResponseModel = SettingResponseModel.fromJson(jsonMap);
      return settingResponseModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }

  ///Cms

  Future<CmsResponseModel?> getCmsData({String? apiEndPoint}) async {
    CmsResponseModel cmsResponseModel;
    try {
      var authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.get(
        Uri.parse(ApiUrls.baseUrl + (apiEndPoint ?? '')),
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + (apiEndPoint ?? '')}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final List<dynamic> jsonMap = json.decode(response.body);
      cmsResponseModel = CmsResponseModel.fromJson(jsonMap);
      return cmsResponseModel;
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
      var authToken = await SharedPreferencesHelper.getToken();
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
      var authToken = await SharedPreferencesHelper.getToken();
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



   Future<GetMessageListApiResponse?> getMessageListApiResponse() async {
    GetMessageListApiResponse userDataModel;
    try {
      var authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.messageList),
        body: {
          
        },
        headers: headers,
      );
      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.messageList}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = GetMessageListApiResponse.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }


 Future<dynamic?> getMessageHistoryApiResponse(Map params) async {
    try {
      var authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.get_message_list),
        body: params,
        headers: headers,
      );
      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.messageList}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      return jsonMap;
     
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
      var authToken = await SharedPreferencesHelper.getToken();
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

  Future<AddMoneyToWallet?> addMoneyToWallet(
      {String? amount, String? source}) async {
    AddMoneyToWallet userDataModel;
    try {
      var authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.addMoneyToWalletEndPoint),
        body: {
          ApiUrls.amount: amount,
          ApiUrls.source: source,
        },
        headers: headers,
      );
      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.addMoneyToWalletEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = AddMoneyToWallet.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }

  Future<UserDataModel?> debitMoneyFromWallet(
      {int? amount, String? source, String? note}) async {
    UserDataModel userDataModel;
    try {
      var authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.debitMoneyFromWalletEndPoint),
        body: {
          ApiUrls.amount: amount,
          ApiUrls.source: source,
          ApiUrls.note: note,
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

  Future<GetWalletDetailsApiResponse?> getUserWalletDetails() async {
    GetWalletDetailsApiResponse userDataModel;
    try {
      var authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.getUserWalletDetailsEndPoint),
        body: {},
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.getUserWalletDetailsEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = GetWalletDetailsApiResponse.fromJson(jsonMap);
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
      var authToken = await SharedPreferencesHelper.getToken();
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
        print(
            'URL: ${ApiUrls.baseUrl + ApiUrls.withdrawalRequestListEndPoint}');
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

  Future<UserDataModel?> withdrawalRequestGenerate(
      {int? amount,
      String? withDrawalType,
      int? upiId,
      int? accountNumber,
      int? ifscCode,
      String? accountName}) async {
    UserDataModel userDataModel;
    try {
      var authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.withdrawalRequestGenerateEndPoint),
        body: {
          ApiUrls.amount: amount,
          ApiUrls.withdrawalType: withDrawalType,
          ApiUrls.upiId: upiId,
          ApiUrls.accountNumber: accountNumber,
          ApiUrls.ifscCode: ifscCode,
          ApiUrls.accountName: accountName,
        },
        headers: headers,
      );

      if (kDebugMode) {
        print(
            'URL: ${ApiUrls.baseUrl + ApiUrls.withdrawalRequestGenerateEndPoint}');
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

  Future<OrderWithRazorpayApiResponse?> orderWithRazorpay(
      {String? amount}) async {
    OrderWithRazorpayApiResponse userDataModel;
    try {
      var authToken = await SharedPreferencesHelper.getToken();
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
      userDataModel = OrderWithRazorpayApiResponse.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }

  Future<IntrestedInYouApiResponse?> getIntrestedInYou(
      Map params) async {
    IntrestedInYouApiResponse userDataModel;
    try {
      var authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.intrestedInYou),
        body: params,
        headers: headers,
      );

      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.intrestedInYou}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      userDataModel = IntrestedInYouApiResponse.fromJson(jsonMap);
      return userDataModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }

  Future<UserDataModel?> checkoutWithRazorpay({required Map params}) async {
    UserDataModel userDataModel;
    try {
      var authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.checkoutWithRazorpayEndPoint),
        body: params,
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

  ///Map

  Future<NearestUserListModel?> getNearestUserList(
      {String? lat, String? lang, String? km}) async {
    NearestUserListModel nearestUserListModel;
    try {
      var authToken = await SharedPreferencesHelper.getToken();
      final Map<String, String>  headers = {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      dynamic response = await http.post(
        Uri.parse(ApiUrls.baseUrl + ApiUrls.getNearestUsersEndPoint),
        body: {
          ApiUrls.currentLat: lat,
          ApiUrls.currentLong:lang,
          ApiUrls.km:km,
        },
        headers: headers,
      );
      if (kDebugMode) {
        print('URL: ${ApiUrls.baseUrl + ApiUrls.getNearestUsersEndPoint}');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      nearestUserListModel = NearestUserListModel.fromJson(jsonMap);
      return nearestUserListModel;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      debugPrint(error.toString());
    }
  }
}
