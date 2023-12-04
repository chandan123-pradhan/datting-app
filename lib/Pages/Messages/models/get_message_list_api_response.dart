class GetMessageListApiResponse {
  GetMessageListApiResponse({
    required this.message,
    required this.status,
    required this.success,
    required this.data,
    required this.imgUrl,
  });
  late final String message;
  late final bool status;
  late final bool success;
  late final List<MessagedUser> data;
  late final String imgUrl;
  
  GetMessageListApiResponse.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    success = json['success'];
    data = List.from(json['data']).map((e)=>MessagedUser.fromJson(e)).toList();
    imgUrl = json['img_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    _data['success'] = success;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['img_url'] = imgUrl;
    return _data;
  }
}

class MessagedUser {
  MessagedUser({
    required this.id,
    required this.status,
    required this.actionDoneBy,
    required this.actionDoneTo,
    required this.createdAt,
    required this.updatedAt,
    required this.actionDoneToUser,
    required this.actionDoneByUser,
    required this.unreadEmailsCount,
  });
  late final String id;
  late final int status;
  late final String actionDoneBy;
  late final String actionDoneTo;
  late final String createdAt;
  late final String updatedAt;
  late final List<ActionDoneToUser> actionDoneToUser;
  late final List<ActionDoneByUser> actionDoneByUser;
  late final int unreadEmailsCount;
  
  MessagedUser.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    status = json['status'];
    actionDoneBy = json['action_done_by'];
    actionDoneTo = json['action_done_to'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    actionDoneToUser = List.from(json['action_done_to_user']).map((e)=>ActionDoneToUser.fromJson(e)).toList();
    actionDoneByUser = List.from(json['action_done_by_user']).map((e)=>ActionDoneByUser.fromJson(e)).toList();
    unreadEmailsCount = json['unreadEmailsCount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['status'] = status;
    _data['action_done_by'] = actionDoneBy;
    _data['action_done_to'] = actionDoneTo;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['action_done_to_user'] = actionDoneToUser.map((e)=>e.toJson()).toList();
    _data['action_done_by_user'] = actionDoneByUser.map((e)=>e.toJson()).toList();
    _data['unreadEmailsCount'] = unreadEmailsCount;
    return _data;
  }
}

class ActionDoneToUser {
  ActionDoneToUser({
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
  });
  late final String id;
  late final String firstName;
  late final String lastName;
  late final int notification;
  late final List<String> intrest;
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
  
  ActionDoneToUser.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    notification = json['notification'];
    intrest = List.castFrom<dynamic, String>(json['intrest']);
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
    image = json['image'];
    age = json['age'];
    loc = Loc.fromJson(json['loc']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['notification'] = notification;
    _data['intrest'] = intrest;
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

class ActionDoneByUser {
  ActionDoneByUser({
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
  });
  late final String id;
  late final String firstName;
  late final String lastName;
  late final int notification;
  late final List<String> intrest;
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
  
  ActionDoneByUser.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    notification = json['notification'];
    intrest = List.castFrom<dynamic, String>(json['intrest']);
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
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['notification'] = notification;
    _data['intrest'] = intrest;
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
    return _data;
  }
}