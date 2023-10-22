import 'package:dating_app/Models/base_model.dart';
import 'package:dating_app/Models/register_mobilenumber_model.dart';
import 'package:dating_app/Models/userdata_model.dart';
import 'package:dating_app/Network/api_provider.dart';
import 'package:flutter/foundation.dart';

abstract class SettingRepository {
  Future<UserDataModel?> getSettingData();
}

class SettingRepositoryImp extends SettingRepository {
  @override
  Future<UserDataModel?> getSettingData() async {
    UserDataModel? registerMobileNumberModel;
    try {
      registerMobileNumberModel =
      await ApiProvider().getSettings();
      return registerMobileNumberModel;
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return registerMobileNumberModel;
  }

}
