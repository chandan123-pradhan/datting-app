import 'package:dating_app/Models/base_model.dart';
import 'package:dating_app/Network/api_provider.dart';
import 'package:dating_app/Pages/Map/Model/nearest_user_list_model.dart';
import 'package:flutter/foundation.dart';

abstract class MapRepository {
  Future<NearestUserListModel?> getNearestUserList({String? lat, String? lang, String? km});
}

class MapRepositoryImp extends MapRepository {
  @override
  Future<NearestUserListModel?> getNearestUserList({String? lat, String? lang, String? km}) async {
    NearestUserListModel? nearestUserListModel;
    try {
      nearestUserListModel =
      await ApiProvider().getNearestUserList(lang: lang,lat: lat,km: km);
      return nearestUserListModel;
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return nearestUserListModel;
  }

}
