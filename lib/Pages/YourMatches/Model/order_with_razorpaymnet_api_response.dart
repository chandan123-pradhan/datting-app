class OrderWithRazorpayApiResponse {
  OrderWithRazorpayApiResponse({
    required this.orderId,
    required this.data,
  });
  late final String orderId;
  late final Data data;
  
  OrderWithRazorpayApiResponse.fromJson(Map<String, dynamic> json){
    orderId = json['order_id'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['order_id'] = orderId;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.userId,
     required this.razorpayOrderId,
    required this.razorpayPaymentId,
    required this.razorpaySignature,
    required this.currency,
    required this.status,
    required this.id,
    required this.orderId,
    required this.amount,
    required this.receiptId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });
  late final String userId;
  late final String razorpayOrderId;
  late final String razorpayPaymentId;
  late final String razorpaySignature;
  late final String currency;
  late final String status;
  late final String id;
  late final String orderId;
  late final int amount;
  late final String receiptId;
  late final String createdAt;
  late final String updatedAt;
  late final int v;
  
  Data.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
    razorpayOrderId = json['razorpayOrderId'].toString();
    razorpayPaymentId = json['razorpayPaymentId'].toString();
    razorpaySignature = json['razorpaySignature'].toString();
    currency = json['currency'];
    status = json['status'];
    id = json['_id'];
    orderId = json['order_id'];
    amount = json['amount'];
    receiptId = json['receipt_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['razorpay_order_id'] = razorpayOrderId;
    _data['razorpay_payment_id'] = razorpayPaymentId;
    _data['razorpay_signature'] = razorpaySignature;
    _data['currency'] = currency;
    _data['status'] = status;
    _data['_id'] = id;
    _data['order_id'] = orderId;
    _data['amount'] = amount;
    _data['receipt_id'] = receiptId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['__v'] = v;
    return _data;
  }
}