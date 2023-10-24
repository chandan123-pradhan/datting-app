class SettingResponseModel {
  SettingResponseModel({
    required this.message,
    required this.status,
    required this.success,
    required this.data,
  });

  final String message;
  final int status;
  final bool success;
  final List<SettingData> data;

  factory SettingResponseModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic>? dataList = json['data'] as List<dynamic>?;

    final data = dataList != null
        ? dataList.map((item) => SettingData.fromJson(item)).toList()
        : <SettingData>[];

    return SettingResponseModel(
      message: json['message'] as String,
      status: json['status'] as int,
      success: json['success'] as bool,
      data: data,
    );
  }
}

class SettingData {
  SettingData({
    required this.referralAmount,
    required this.createdAt,
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.v,
  });

  final int referralAmount;
  final String createdAt;
  final String id;
  final String name;
  final String email;
  final String mobile;
  final int v;

  factory SettingData.fromJson(Map<String, dynamic> json) {
    return SettingData(
      referralAmount: json['referral_amount'] as int,
      createdAt: json['created_at'] as String,
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      mobile: json['mobile'] as String,
      v: json['__v'] as int,
    );
  }
}
