import 'package:dating_app/Models/base_model.dart';
import 'package:dating_app/Models/register_mobilenumber_model.dart';
import 'package:dating_app/Models/userdata_model.dart';
import 'package:dating_app/Network/api_provider.dart';
import 'package:dating_app/Pages/Settings/Model/setting_response_model.dart';
import 'package:flutter/foundation.dart';

abstract class SettingRepository {
  Future<SettingResponseModel?> getSettingData();
}

class SettingRepositoryImp extends SettingRepository {
  @override
  Future<SettingResponseModel?> getSettingData() async {
    SettingResponseModel? settingResponseModel;
    try {
      settingResponseModel =
      await ApiProvider().getSettings();
      return settingResponseModel;
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return settingResponseModel;
  }

}
