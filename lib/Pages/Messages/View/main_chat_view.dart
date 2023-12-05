import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Helper/navigation_helper.dart';
import 'package:dating_app/Pages/Dashboard/controllers/dashboard_controllers.dart';
import 'package:dating_app/Pages/Messages/Widgets/other_card_widget.dart';
import 'package:dating_app/Pages/Messages/Widgets/reply_card_widget.dart';
import 'package:dating_app/Pages/Messages/controllers/messages_controller.dart';
import 'package:dating_app/Pages/Messages/models/get_message_list_api_response.dart';
import 'package:dating_app/Pages/ProfileDetail/View/profile_detail_view.dart';
import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/event_buss_manager.dart';
import 'package:dating_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainChatView extends StatefulWidget {
  MessagedUser messagedUser;
  MainChatView({required this.messagedUser});

  @override
  State<MainChatView> createState() => _MainChatViewState();
}

class _MainChatViewState extends State<MainChatView> {
  TextEditingController controller = TextEditingController();
  int? _value;
  var dashboardController = Get.put(DashboardControllers());
EventBusManager eventBusManager=new EventBusManager();
  var cController = Get.put(ChatController());
  @override
  void initState() {
    cController.getMessageHistory(
        yourId: widget.messagedUser.actionDoneToUser[0].id,
        memberId: widget.messagedUser.actionDoneByUser[0].id);
    // cController.listenMessage();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: ()async{
         cController.disconnectAll();
         return Future.value(true);

      },
      child: Scaffold(
        backgroundColor: ThemeConfiguration.mainChatPageBg,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ThemeConfiguration.primaryColor,
          title: Row(
            children: [
              InkWell(
                onTap: () {
                  cController.disconnectAll();
                  Navigator.pushNamed(context, NavigationHelper.profileDetail);
                },
                child: CachedNetworkImage(
                  height: 52,
                  width: 52,
                  imageUrl: dashboardController.messageListApiResponse!.imgUrl +
                      widget.messagedUser.actionDoneByUser[0].image,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Icon(Icons.person_2_outlined),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              const SizedBox(
                width: SizeConstants.mainPagePadding,
              ),
              Text(
                widget.messagedUser.actionDoneByUser[0].fullName,
                style: ThemeConfiguration.buttonTextStyle(),
              )
            ],
          ),
          actions: [
            PopupMenuButton<int>(
                itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                      const PopupMenuItem<int>(
                          value: 2, child: Text(StringConstants.block)),
                    ],
                onSelected: (int value) {
                  setState(() {
                    _value = value;
                  });
                })
          ],
        ),
        body: SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 1 -
                            SizeConstants.chatPageBottomPadding,
                        width: MediaQuery.of(context).size.width / 1,
                        child: Column(
                          children: [
                           GetBuilder<ChatController>(
            init: ChatController(),
            builder: (chatController) {
              return chatController.isLoading
                  ? Expanded(
                   // height: MediaQuery.of(context).size.height/1.5,
                    child: Center(
                        child: CircularProgressIndicator(),
                      ),
                  )
                  :  Expanded(
                                    child: chatController.messageList.isEmpty
                                        ? Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Icon(
                                                  Icons.child_care_outlined,
                                                  size: 100,
                                                  color: ColorConstant.primaryColor,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  "Nothing here...",
                                                  style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 25),
                                                )
                                              ],
                                            ),
                                          )
                                        : ListView.builder(
                                          controller: chatController.scrollController,
                                          padding: EdgeInsets.only(top: 10,bottom: 100),
                                            itemCount:
                                                chatController.messageList.length,
                                            itemBuilder: (context, index) {
                                              return chatController
                                                      .messageList[index].isYours==false
                                                  ? Padding(
                                                    padding: const EdgeInsets.only(top:8.0),
                                                    child: OtherCardWidget(
                                                      msg: chatController.messageList[index].message
                                                    ),
                                                  )
                                                  : Padding(
                                                    padding: const EdgeInsets.only(top:8.0),
                                                    child: ReplyCardWidget(
                                                      msg: chatController.messageList[index].message
                                                                                               
                                                    ),
                                                  );
                                            })
    
                                    // Column(
                                    //   children: [
    
                                    // SizedBox(
                                    //   height: MediaQuery.of(context).size.height / 1.3,
                                    //   width: MediaQuery.of(context).size.width / 1,
                                    //   child:
    
                                    //   SingleChildScrollView(
                                    //     child: Padding(
                                    //       padding:
                                    //           EdgeInsets.all(SizeConstants.mainPagePadding),
                                    //       child: Column(
                                    //         children: [
                                    //           SizedBox(
                                    //             height: SizeConstants.smallPadding,
                                    //           ),
                                    //           ReplyCardWidget(),
                                    //           SizedBox(
                                    //             height: SizeConstants.maximumPadding +
                                    //                 SizeConstants.smallPadding,
                                    //           ),
                                    //           OtherCardWidget(),
                                    //         ],
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    //  ],
                                    //  ),
                                    );
                              }
                            ),
                             SizedBox(
                                  width: MediaQuery.of(context).size.width / 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: SizeConstants.bigPadding -
                                            SizeConstants.mediumPadding),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  1.35,
                                          height: SizeConstants.buttonHeight,
                                          decoration: BoxDecoration(
                                            color: ThemeConfiguration
                                                .scaffoldBgColor,
                                            borderRadius:
                                                BorderRadius.circular(35),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    Colors.grey.withOpacity(0.1),
                                                spreadRadius: 1,
                                                blurRadius: 7,
                                                offset: const Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          child: CommonWidgets.inputField(
                                              context: context,
                                              hintText:
                                                  StringConstants.typeMsgHint,
                                              textInputType: TextInputType.text,
                                              textFieldController: controller),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            cController.sendMessage(
                                                yourId: widget.messagedUser
                                                    .actionDoneByUser[0].id,
                                                memberId: widget.messagedUser
                                                    .actionDoneToUser[0].id,
                                                msg: controller.text);
                                            controller.clear();
                                          },
                                          child: Container(
                                            width: SizeConstants.buttonHeight,
                                            height: SizeConstants.buttonHeight,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ThemeConfiguration
                                                  .scaffoldBgColor,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.1),
                                                  spreadRadius: 1,
                                                  blurRadius: 7,
                                                  offset: const Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: const Icon(
                                              Icons.send_outlined,
                                              size:
                                                  SizeConstants.mainPagePadding +
                                                      SizeConstants.smallPadding,
                                              color:
                                                  ThemeConfiguration.primaryColor,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
              // Padding for the keyboard
              height: MediaQuery.of(context).viewInsets.bottom,
            ),
                          ],
                        ),
                      ),
                    )
            ,
      ),
    );
  }
}
