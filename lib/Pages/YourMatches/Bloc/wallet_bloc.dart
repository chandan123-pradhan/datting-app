import 'dart:developer';

import 'package:dating_app/Pages/YourMatches/Bloc/wallet_repository.dart';
import 'package:dating_app/Pages/YourMatches/Model/add_money_to_wallet.dart';
import 'package:dating_app/Pages/YourMatches/Model/get_wallet_api_response.dart';
import 'package:dating_app/Pages/YourMatches/Model/order_with_razorpaymnet_api_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class WalletController extends GetxController {
  WalletRepository walletRepository = WalletRepository();
  GetWalletDetailsApiResponse? getWalletDetailsApiResponse;
  AddMoneyToWallet? addMoneyToWallet;
  OrderWithRazorpayApiResponse? orderWithRazorpayApiResponse;
  BuildContext? bcontext;
  void getWalletApiResponse() {
    walletRepository.getWalletDetails().then((value) {
      getWalletDetailsApiResponse = value;
      update();
    });
  }

  bool isloading = false;
  Future<void> callAddMoneyToWallet(String amount) async {
    walletRepository.addMoneyToWallet(amount, 'card').then((value) async {
      addMoneyToWallet = value;
      isloading = false;
      getWalletApiResponse();
      update();
      if(f==true){
        Navigator.pop(bcontext!);
      }

    });
  }
bool f=true;
  Future<void> orderWithRazorpay(String amount, context,flag) async {

    isloading = true;
    bcontext=context;
    context = context;
    update();
    walletRepository.orderWithRazorpay(amount).then((value) async {
      orderWithRazorpayApiResponse = value;
f=flag;
      update();
      launchPaymentGateway(amount, context);
    });
  }

  Future<void> checkoutWithRazorpay(
    String amount,
    tranId,
  ) async {
    walletRepository
        .checkoutWithRazorpay(amount, tranId, 'paid')
        .then((value) async {
      orderWithRazorpayApiResponse = value;

      update();
      callAddMoneyToWallet(amount);
    });
  }

  void launchPaymentGateway(amount, context) {
    Razorpay razorpay = Razorpay();
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': double.parse(amount) * 100,
      'name': 'Acme Corp.',
      'description': 'Buy Coins',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
    razorpay.open(options);
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
   try{
     checkoutWithRazorpay(orderWithRazorpayApiResponse!.data.amount.toString(),
       response.paymentId);
   }catch(e){
    print(e);
    isloading=false;
    update();
   }
    // callAddMoneyToWallet(response.p)
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {}
}
