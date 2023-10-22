class BaseModel {
  String? message;
  bool? success;

  BaseModel({
    this.message,
    this.success,
  });

  BaseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
  }

}
