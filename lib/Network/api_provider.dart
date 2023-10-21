import 'dart:convert';
import 'dart:io';

import 'package:dating_app/Helper/shared_preference_helper.dart';
import 'package:dating_app/Models/base_model.dart';
import 'package:dating_app/Models/register_mobilenumber_model.dart';
import 'package:dating_app/Models/userdata_model.dart';
import 'package:dating_app/Network/api_urls.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  final Dio _dio = Dio();


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

}
