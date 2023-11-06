class GetWalletDetailsApiResponse {
  GetWalletDetailsApiResponse({
    required this.message,
    required this.success,
    required this.data,
  });
  late final String message;
  late final bool success;
  late final Data data;
  
  GetWalletDetailsApiResponse.fromJson(Map<String, dynamic> json){
    message = json['message'];
    success = json['success'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['success'] = success;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.walletBalance,
    required this.transactions,
  });
  late final String walletBalance;
  late final List<Transactions> transactions;
  
  Data.fromJson(Map<String, dynamic> json){
    walletBalance = json['wallet_balance'].toString();
    transactions = List.from(json['transactions']).map((e)=>Transactions.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['wallet_balance'] = walletBalance;
    _data['transactions'] = transactions.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Transactions {
  Transactions({
    required this.amount,
    required this.transactionType,
    required this.transactionId,
    required this.source,
    required this.bankName,
    required this.accountNumber,
    required this.ifscCode,
    required this.status,
    required this.lastStatusUpdateDate,
    required this.note,
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.createdAt2,
    required this.updatedAt2,
    required this.v,
  });
  late final int amount;
  late final String transactionType;
  late final String transactionId;
  late final String source;
  late final String bankName;
  late final String accountNumber;
  late final String ifscCode;
  late final int status;
  late final String lastStatusUpdateDate;
  late final String note;
  late final String id;
  late final UserId userId;
  late final String createdAt;
  late final String updatedAt;
  late final String createdAt2;
  late final String updatedAt2;
  late final int v;
  
  Transactions.fromJson(Map<String, dynamic> json){
    amount = json['amount'];
    transactionType = json['transaction_type'];
    transactionId = json['transaction_id'];
    source = json['source'];
    bankName = json['bank_name'];
    accountNumber = json['account_number'];
    ifscCode = json['ifsc_code'];
    status = json['status'];
    lastStatusUpdateDate = json['last_status_update_date'];
    note = json['note'];
    id = json['_id'];
    userId = UserId.fromJson(json['user_id']);
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdAt2 = json['createdAt'];
    updatedAt2 = json['updatedAt'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['amount'] = amount;
    _data['transaction_type'] = transactionType;
    _data['transaction_id'] = transactionId;
    _data['source'] = source;
    _data['bank_name'] = bankName;
    _data['account_number'] = accountNumber;
    _data['ifsc_code'] = ifscCode;
    _data['status'] = status;
    _data['last_status_update_date'] = lastStatusUpdateDate;
    _data['note'] = note;
    _data['_id'] = id;
    _data['user_id'] = userId.toJson();
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['createdAt'] = createdAt2;
    _data['updatedAt'] = updatedAt2;
    _data['__v'] =v;
    return _data;
  }
}

class UserId {
  UserId({
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
    required this.id,
    required this.mobileNumber,
    required this.userReferralCode,
    required this.createdAt,
    required this.updatedAt,
    required this.createdAt2,
    required this.updatedAt2,
    required this.v,
    required this.fullName,
    required this.birthDay,
    required this.gender,
    required this.image,
  });
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
  late final String id;
  late final String mobileNumber;
  late final String userReferralCode;
  late final String createdAt;
  late final String updatedAt;
  late final String createdAt2;
  late final String updatedAt2;
  late final int v;
  late final String fullName;
  late final String birthDay;
  late final String gender;
  late final String image;
  
  UserId.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    notification = json['notification'];
    intrest = List.castFrom<dynamic, String>(json['intrest']);
    about = json['about'];
    locationTitle = json['locationTitle'].toString();
    locationCity = json['locationCity'].toString();
    locationState = json['locationState'].toString();
    locationCountry = json['locationCountry'].toString();
    locationPincode = json['locationPincode'].toString();
    approved = json['approved'];
    wallet = json['wallet'];
    id = json['_id'];
    mobileNumber = json['mobile_number'];
    userReferralCode = json['user_referral_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdAt2 = json['createdAt'];
    updatedAt2 = json['updatedAt'];
    v = json['__v'];
    fullName = json['full_name'];
    birthDay = json['birth_day'];
    gender = json['gender'];
    image = (json['image']??'');
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
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
    _data['_id'] = id;
    _data['mobile_number'] = mobileNumber;
    _data['user_referral_code'] = userReferralCode;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['createdAt'] = createdAt2;
    _data['updatedAt'] = updatedAt2;
    _data['__v'] = v;
    _data['full_name'] = fullName;
    _data['birth_day'] = birthDay;
    _data['gender'] = gender;
    _data['image'] = image;
    return _data;
  }
}