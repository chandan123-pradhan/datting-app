


class UserDataModel {
  String? message;
  bool? status;
  bool? success;
  UserData? data;

  UserDataModel({
     this.message,
     this.status,
     this.success,
     this.data,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      message: json['message'],
      status: json['status'],
      success: json['success'],
      data: UserData.fromJson(json['data']),
    );
  }
}



class UserData {
  final String firstName;
  final String lastName;
  final int notification;
  final List<dynamic> interests;
  final String about;
  final bool approved;
  final double wallet;
  final String id;
  final String mobileNumber;
  final String userReferralCode;
  final String createdAt;
  final String updatedAt;

  UserData({
    required this.firstName,
    required this.lastName,
    required this.notification,
    required this.interests,
    required this.about,
    required this.approved,
    required this.wallet,
    required this.id,
    required this.mobileNumber,
    required this.userReferralCode,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "notification": notification,
      "intrest": interests,
      "about": about,
      "approved": approved,
      "wallet": wallet,
      "_id": id,
      "mobile_number": mobileNumber,
      "user_referral_code": userReferralCode,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      notification: json['notification'] ?? 0,
      interests: (json['intrest']??[])
          .map((interest) => interest)
          .toList(),
      about: json['about'] ?? '',
      approved: json['approved'] ?? false,
      wallet: json['wallet']?.toDouble() ?? 0.0,
      id: json['_id'] ?? '',
      mobileNumber: json['mobile_number'] ?? '',
      userReferralCode: json['user_referral_code'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}
