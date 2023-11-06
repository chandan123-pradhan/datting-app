class AddMoneyToWallet {
  AddMoneyToWallet({
    required this.message,
    required this.success,
    required this.data,
  });
  late final String message;
  late final bool success;
  late final TransactionData data;
  
  AddMoneyToWallet.fromJson(Map<String, dynamic> json){
    message = json['message'];
    success = json['success'];
    data = TransactionData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['success'] = success;
    _data['data'] = data.toJson();
    return _data;
  }
}

class TransactionData {
  TransactionData({
    required this.walletBalance,
    required this.transactions,
  });
  late final int walletBalance;
  late final List<Transactions> transactions;
  
  TransactionData.fromJson(Map<String, dynamic> json){
    walletBalance = json['wallet_balance'];
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
  late final String userId;
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
    userId = json['user_id'];
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
    _data['user_id'] = userId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['createdAt'] = createdAt2;
    _data['updatedAt'] = updatedAt2;
    _data['__v'] = v;
    return _data;
  }
}