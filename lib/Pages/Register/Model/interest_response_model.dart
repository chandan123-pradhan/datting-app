class InterestResponseModel {
  InterestResponseModel({
    required this.data,
    required this.message,
  });
  late final List<Data> data;
  late final String message;

  InterestResponseModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.intrest,
    required this.status,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String intrest;
  late final int status;
  late final String id;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  Data.fromJson(Map<String, dynamic> json){
    intrest = json['intrest'];
    status = json['status'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['intrest'] = intrest;
    _data['status'] = status;
    _data['_id'] = id;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}