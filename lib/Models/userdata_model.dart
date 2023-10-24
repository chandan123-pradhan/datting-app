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
  final List<Interest> interests;
  final String about;
  final bool approved;
  final double wallet;
  final String id;
  final String mobileNumber;
  final String userReferralCode;
  final String createdAt;
  final String updatedAt;
  final String fullName;
  final String birthday;
  final String gender;
  final String image;

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
    required this.fullName,
    required this.birthday,
    required this.gender,
    required this.image,
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
      "full_name": fullName,
      "birth_day": birthday,
      "gender": gender,
      "image": image,
    };
  }

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      notification: json['notification'] ?? 0,
      interests: (json['intrest'] as List<dynamic>)
          .map((item) => Interest.fromJson(item))
          .toList(), about: json['about'] ?? '',
      approved: json['approved'] ?? false,
      wallet: json['wallet']?.toDouble() ?? 0.0,
      id: json['_id'] ?? '',
      mobileNumber: json['mobile_number'] ?? '',
      userReferralCode: json['user_referral_code'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      fullName: json["full_name"] ?? '',
      birthday: json["birth_day"] ?? '',
      gender: json["gender"] ?? '',
      image: json["image"] ?? '',
    );
  }
}

class Interest {
  String intrest;
  int status;
  String id;
  String createdAt;
  String updatedAt;
  int v;
  bool? isSelected=false;

  Interest({
    required this.intrest,
    required this.status,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
     this.isSelected,
  });

  factory Interest.fromJson(Map<String, dynamic> json) {
    return Interest(
      intrest: json['intrest'] as String,
      status: json['status'] as int,
      id: json['_id'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      v: json['__v'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'intrest': intrest,
      'status': status,
      '_id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
    return data;
  }
}





