class NearestUserListModel {
  String? message;
  bool? status;
  bool? success;
  List<Data>? data;
  String? imagePath;

  NearestUserListModel({this.message, this.status, this.success, this.data, this.imagePath});

  NearestUserListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    success = json['success'];
     imagePath=json['img_url'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['success'] = this.success;
    data['img_url']=this.imagePath;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? firstName;
  String? lastName;
  int? notification;
  List<String>? intrest;
  String? about;
  String? locationTitle;
  String? locationCity;
  String? locationState;
  String? locationCountry;
  String? locationPincode;
  String? image;
  int? age;
  Null? imageType;
  bool? approved;
  int? wallet;
  String? sId;
  String? mobileNumber;
  String? userReferralCode;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? fullName;
  String? birthDay;
  String? gender;
  Loc? loc;

  Data(
      {this.firstName,
        this.lastName,
        this.notification,
        this.intrest,
        this.about,
        this.locationTitle,
        this.locationCity,
        this.locationState,
        this.locationCountry,
        this.locationPincode,
        this.image,
        this.age,
        this.imageType,
        this.approved,
        this.wallet,
        this.sId,
        this.mobileNumber,
        this.userReferralCode,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.fullName,
        this.birthDay,
        this.gender,
        this.loc});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    notification = json['notification'];
    intrest = json['intrest'].cast<String>();
    about = json['about'];
    locationTitle = json['location_title'];
    locationCity = json['location_city'];
    locationState = json['location_state'];
    locationCountry = json['location_country'];
    locationPincode = json['location_pincode'];
    image = json['image'];
    age = json['age'];
    imageType = json['image_type'];
    approved = json['approved'];
    wallet = json['wallet'];
    sId = json['_id'];
    mobileNumber = json['mobile_number'];
    userReferralCode = json['user_referral_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    fullName = json['full_name'];
    birthDay = json['birth_day'];
    gender = json['gender'];
    loc = json['loc'] != null ? new Loc.fromJson(json['loc']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['notification'] = this.notification;
    data['intrest'] = this.intrest;
    data['about'] = this.about;
    data['location_title'] = this.locationTitle;
    data['location_city'] = this.locationCity;
    data['location_state'] = this.locationState;
    data['location_country'] = this.locationCountry;
    data['location_pincode'] = this.locationPincode;
    data['image'] = this.image;
    data['age'] = this.age;
    data['image_type'] = this.imageType;
    data['approved'] = this.approved;
    data['wallet'] = this.wallet;
    data['_id'] = this.sId;
    data['mobile_number'] = this.mobileNumber;
    data['user_referral_code'] = this.userReferralCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['full_name'] = this.fullName;
    data['birth_day'] = this.birthDay;
    data['gender'] = this.gender;
    if (this.loc != null) {
      data['loc'] = this.loc!.toJson();
    }
    return data;
  }
}

class Loc {
  String? type;
  List<double>? coordinates;

  Loc({this.type, this.coordinates});

  Loc.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}
