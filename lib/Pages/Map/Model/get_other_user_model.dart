class GetOthersUserProfileApiResponse {
  GetOthersUserProfileApiResponse({
    required this.message,
    required this.status,
    required this.success,
    required this.data,
    required this.imgUrl,
    required this.isLiked,
  });
  late final String message;
  late final bool status;
  late final bool success;
  late final Data data;
  late final String imgUrl;
  late bool isLiked;
  
  GetOthersUserProfileApiResponse.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    success = json['success'];
    data = Data.fromJson(json['data']);
    imgUrl = json['img_url'];
    isLiked=json['isLiked'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    _data['success'] = success;
    _data['data'] = data.toJson();
    _data['img_url'] = imgUrl;
    _data['isLiked']=isLiked;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.notification,
    required this.intrest,
    required this.about,
    required this.locationTitle,
    required this.locationCity,
    required this.locationState,
    required this.locationCountry,
    required this.locationPincode,
    required this.approved,
    required this.wallet,
    required this.mobileNumber,
    required this.userReferralCode,
    required this.createdAt,
    required this.updatedAt,
    required this.createdAt2,
    required this.updatedAt2,
    required this.V,
    required this.fullName,
    required this.birthDay,
    required this.gender,
    required this.image,
    required this.age,
    required this.loc,
    required this.images,
  });
  late final String id;
  late final String firstName;
  late final String lastName;
  late final int notification;
  late final List<Intrest> intrest;
  late final String about;
  late final String locationTitle;
  late final String locationCity;
  late final String locationState;
  late final String locationCountry;
  late final String locationPincode;
  late final bool approved;
  late final int wallet;
  late final String mobileNumber;
  late final String userReferralCode;
  late final String createdAt;
  late final String updatedAt;
  late final String createdAt2;
  late final String updatedAt2;
  late final int V;
  late final String fullName;
  late final String birthDay;
  late final String gender;
  late final String image;
  late final int age;
  late final Loc loc;
  late final List<Images> images;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    notification = json['notification'];
    intrest = List.from(json['intrest']).map((e)=>Intrest.fromJson(e)).toList();
    about = json['about'];
    locationTitle = json['location_title'];
    locationCity = json['location_city'];
    locationState = json['location_state'];
    locationCountry = json['location_country'];
    locationPincode = json['location_pincode'];
    approved = json['approved'];
    wallet = json['wallet'];
    mobileNumber = json['mobile_number'];
    userReferralCode = json['user_referral_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdAt2 = json['createdAt'];
    updatedAt2 = json['updatedAt'];
    V = json['__v'];
    fullName = json['full_name'];
    birthDay = json['birth_day'];
    gender = json['gender'];
    image = json['image'].toString();
    age = json['age'];
    loc = Loc.fromJson(json['loc']);
    images = List.from(json['images']).map((e)=>Images.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['notification'] = notification;
    _data['intrest'] = intrest.map((e)=>e.toJson()).toList();
    _data['about'] = about;
    _data['location_title'] = locationTitle;
    _data['location_city'] = locationCity;
    _data['location_state'] = locationState;
    _data['location_country'] = locationCountry;
    _data['location_pincode'] = locationPincode;
    _data['approved'] = approved;
    _data['wallet'] = wallet;
    _data['mobile_number'] = mobileNumber;
    _data['user_referral_code'] = userReferralCode;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['createdAt'] = createdAt2;
    _data['updatedAt'] = updatedAt2;
    _data['__v'] = V;
    _data['full_name'] = fullName;
    _data['birth_day'] = birthDay;
    _data['gender'] = gender;
    _data['image'] = image;
    _data['age'] = age;
    _data['loc'] = loc.toJson();
    _data['images'] = images.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Intrest {
  Intrest({
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
  
  Intrest.fromJson(Map<String, dynamic> json){
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

class Loc {
  Loc({
    required this.type,
    required this.coordinates,
  });
  late final String type;
  late final List<double> coordinates;
  
  Loc.fromJson(Map<String, dynamic> json){
    type = json['type'];
    coordinates = List.castFrom<dynamic, double>(json['coordinates']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['coordinates'] = coordinates;
    return _data;
  }
}

class Images {
  Images({
    required this.image,
    required this.imageType,
    required this.status,
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String image;
  late final String imageType;
  late final int status;
  late final String id;
  late final String userId;
  late final String createdAt;
  late final String updatedAt;
  late final int V;
  
  Images.fromJson(Map<String, dynamic> json){
    image = json['image'];
    imageType = json['image_type'];
    status = json['status'];
    id = json['_id'];
    userId = json['user_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image'] = image;
    _data['image_type'] = imageType;
    _data['status'] = status;
    _data['_id'] = id;
    _data['user_id'] = userId;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}