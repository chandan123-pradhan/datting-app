import 'dart:async';
import 'dart:developer';

import 'package:dating_app/Network/api_provider.dart';
import 'package:dating_app/Pages/Messages/models/chat_model.dart';
import 'package:dating_app/utils/event_buss_manager.dart';
import 'package:dating_app/utils/socket_io.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  List<ChatModel> messageList = [];
  bool isLoading = true;
  String yourUserId = '';
  EventBusManager eventBusManager = new EventBusManager();
  StreamSubscription? subscription;

  SocketServices socketServices = new SocketServices();
  final ScrollController scrollController = ScrollController();
  ApiProvider apiProvider = new ApiProvider();
  void getMessageHistory(
      {required String yourId, required String memberId}) async {
    yourUserId = yourId;
    socketServices.connectSocket(yourId);

    isLoading = true;
    Map params = {'action_done_to': yourId, 'action_done_by': memberId};
    var response = await apiProvider.getMessageHistoryApiResponse(params);
    messageList.clear();
    for (int i = 0; i < response['data'].length; i++) {
      messageList.add(ChatModel(
          message: response['data'][i]['data'],
          fromUser: response['data'][i]['from'],
          toUser: response['data'][i]['to'],
          isYours: yourId == response['data'][i]['to'] ? true : false,
          type: response['data'][i]['type']));
    }
    isLoading = false;
    update();

    updateScoll();
    listenMessage();
  }

  void sendMessage(
      {required String yourId, required String memberId, required String msg}) {
    Map params = {
      'from': yourId,
      'to': memberId,
      'type': 'text',
      'data': msg,
    };
    // debugger();
    socketServices.sendMessage(params);
  }

  void listenMessage() {
    subscription = eventBusManager.eventBus.on().listen((event) {
      // Handle the incoming event
      try {
        messageList.add(ChatModel(
            message: event['data'],
            fromUser: event['from'],
            toUser: event['to'],
            isYours: yourUserId == event['to'] ? true : false,
            type: event['type']));
        update();
        _scrollToBottom();
      } catch (e) {
        debugger();
      }
    });

    // eventBusManager.eventBus.on().listen((event) {
    //   debugger();

    // });
  }

  // Scroll to the bottom of the list
  void _scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  void disconnectAll() {
    socketServices.disconnectSocket();
    subscription?.cancel();
  }

  void updateScoll() {
    Timer(Duration(milliseconds: 100), () {
      _scrollToBottom();
    });
  }
}
