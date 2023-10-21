class RegisterMobileNumberModel {
  String message;
  int status;
  bool success;
  RegisterMobileNumberData data;

  RegisterMobileNumberModel({
    required this.message,
    required this.status,
    required this.success,
    required this.data,
  });

  factory RegisterMobileNumberModel.fromJson(Map<String, dynamic> json) {
    return RegisterMobileNumberModel(
      message: json['message'],
      status: json['status'],
      success: json['success'],
      data: RegisterMobileNumberData.fromJson(json['data']),
    );
  }
}

class RegisterMobileNumberData {
  String token;
  int isRegistered;

  RegisterMobileNumberData({
    required this.token,
    required this.isRegistered,
  });

  factory RegisterMobileNumberData.fromJson(Map<String, dynamic> json) {
    return RegisterMobileNumberData(
      token: json['token'],
      isRegistered: json['is_registered'],
    );
  }
}
