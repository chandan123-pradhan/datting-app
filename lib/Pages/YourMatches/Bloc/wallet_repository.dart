import 'package:dating_app/Network/api_provider.dart';
import 'package:dating_app/Pages/YourMatches/Model/add_money_to_wallet.dart';
import 'package:dating_app/Pages/YourMatches/Model/get_wallet_api_response.dart';
import 'package:dating_app/Pages/YourMatches/Model/order_with_razorpaymnet_api_response.dart';
import 'package:flutter/foundation.dart';

class WalletRepository {
  @override
  Future<GetWalletDetailsApiResponse?> getWalletDetails() async {
    GetWalletDetailsApiResponse? getWalletDetailsApiResponse;
    try {
      return getWalletDetailsApiResponse =
          await ApiProvider().getUserWalletDetails();
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return getWalletDetailsApiResponse;
  }

  Future<AddMoneyToWallet?> addMoneyToWallet(String amount, String src) async {
    AddMoneyToWallet? addMoneyToWallet;
    try {
      return addMoneyToWallet =
          await ApiProvider().addMoneyToWallet(amount: amount, source: src);
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return addMoneyToWallet;
  }

  Future<OrderWithRazorpayApiResponse?> orderWithRazorpay(String amount) async {
    OrderWithRazorpayApiResponse? addMoneyToWallet;
    try {
      return addMoneyToWallet = await ApiProvider().orderWithRazorpay(
        amount: amount,
      );
      
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return addMoneyToWallet;
  }

  Future<dynamic?> checkoutWithRazorpay(amount, tranId, status) async {
    dynamic? addMoneyToWallet;
    try {
      Map param = {
        'payment_data': {'amount': amount, 'transaction_id': tranId},
        'status': status
      };
      return addMoneyToWallet =
          await ApiProvider().checkoutWithRazorpay(params: param);
    } catch (e, err) {
      if (kDebugMode) {
        print("$e \n $err");
      }
    }
    return addMoneyToWallet;
  }
}
