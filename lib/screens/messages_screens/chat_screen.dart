import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class ChatScreens extends StatefulWidget {
  const ChatScreens({super.key});

  @override
  State<ChatScreens> createState() => _ChatScreensState();
}

class _ChatScreensState extends State<ChatScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.chatBgColor,
      body: Container(
        height: MediaQuery.of(context).size.height / 1,
        width: MediaQuery.of(context).size.width / 1,
        child: Column(
          children: [
            Container(
              height: 110,
              color: ColorConstant.primaryColor,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1,
                  ),
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/icons/person_icon.png",
                                height: 45,
                                width: 45,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              TextWidgets.h5Text(
                                  text: 'Kaushiki Kumari',
                                  color: ColorConstant.whiteColor)
                            ],
                          ),
                          Image.asset(
                            'assets/icons/menu_icon.png',
                            height: 16,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
                 Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 1.3,
                          width: MediaQuery.of(context).size.width / 1,
                         child: SingleChildScrollView(
                          child: Column(
                            
                            children: [
                              const SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(width: 1,height: 1,),
                                  Image.asset("assets/images/my_chat.png",
                                  width: MediaQuery.of(context).size.width/1.2,
                                  ),
                                ],
                              ),
                                                            const SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                 
                                  Image.asset("assets/images/other_chat.png",
                                  width: MediaQuery.of(context).size.width/1.2,
                                  ),
                                   const SizedBox(width: 1,height: 1,),
                                ],
                              )
                            ],
                          ),
                         ),
                        ),
                        Expanded(
                            child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 1.35,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: ColorConstant.whiteColor,
                                    borderRadius: BorderRadius.circular(35),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorConstant.whiteColor,
                                  //  borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                      ],
                    ),
                  )
             
          ],
        ),
      ),
    );
  }
}
