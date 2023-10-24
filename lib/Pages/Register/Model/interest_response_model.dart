import 'package:dating_app/Models/userdata_model.dart';

class InterestResponseModel {
  InterestResponseModel({
    this.data,
    this.message,
  });
  List<Interest>? data;
  String? message;

  InterestResponseModel.fromJson(Map<String, dynamic> json) {
    data = (json['data'] as List<dynamic>)
        .map((item) => Interest.fromJson(item))
        .toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data?.map((e) => e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}




