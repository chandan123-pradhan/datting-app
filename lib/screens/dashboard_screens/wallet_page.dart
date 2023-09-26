import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/string_utils.dart';
import 'package:dating_app/utils/text_styles.dart';
import 'package:dating_app/widgets/botton_widget.dart';
import 'package:dating_app/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width / 1,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    left: 20,
                    child: BottonWidgets.backBottonWidget(onTap: () {})),
                TextWidgets.h5Text(text: StringUtils.WALLET)
              ],
            ),
          ),
          Expanded(
              child: Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  
                  children: [
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20),
                      child: Container(
                        height: 92,
                        width: MediaQuery.of(context).size.width / 1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorConstant.cardColor,
                            border: Border.all(
                                width: 1, color: ColorConstant.primaryColor)),
                                       child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 30),
                       child: Row(
                        children: [
                          Image.asset("assets/icons/wallet_icon.png",
                          height: 48,
                          width: 48,
                          ),
                          SizedBox(width: 20,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidgets.descriptiveTag(text: 'Available coins in the wallet')
                           , TextWidgets.h2Tag(text: "412")
                            
                            ],
                          )
                        ],
                       ),
                                       ),
                                       
                                       
                      ),
                    ),
                      SizedBox(height: 50,),

                      Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20),
                        child: TextWidgets.h5Text(text: '‘More the number of coins you have,the more  number of candidates you will  be able tto approc’'),
                      )
                 ,SizedBox(height: 40,),
                 Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width/1,
                  color: ColorConstant.bannerColor,
                  alignment: Alignment.center,
                  child: Text("Buy Coins",
                  style: TextsStyle.h1Style(),
                  )
                 ),

SizedBox(height: 20,),

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child:   Column(
    children: [
      Container(
        height: 50,
        width: MediaQuery.of(context).size.width/1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1,color: Colors.black12)
        ),
        alignment:Alignment.center,
        child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset("assets/icons/coins.png",
                  height: 20,
                  width: 20,
                  
                  ),
                  SizedBox(width: 10,),
                Text("500",style: TextsStyle.h5boldStyle(),)
                ],
              ),
              Container(
                height: 36,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: ColorConstant.bannerColor
                ),
                alignment: Alignment.center,
                child:  Text("50 Rs",style: TextsStyle.h5Style().apply(color: ColorConstant.blackColor),),
              )
            ],
          ),
        ),
      )
  
 , SizedBox(height: 20,),
  
     Container(
        height: 50,
        width: MediaQuery.of(context).size.width/1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1,color: Colors.black12)
        ),
        alignment:Alignment.center,
        child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset("assets/icons/coins.png",
                  height: 20,
                  width: 20,
                  
                  ),
                  SizedBox(width: 10,),
                Text("1000",style: TextsStyle.h5boldStyle(),)
                ],
              ),
              Container(
                height: 36,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: ColorConstant.bannerColor
                ),
                alignment: Alignment.center,
                child:  Text("70 Rs",style: TextsStyle.h5Style().apply(color: ColorConstant.blackColor),),
              )
            ],
          ),
        ),
      )
  
 , SizedBox(height: 20,),
     Container(
        height: 50,
        width: MediaQuery.of(context).size.width/1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1,color: Colors.black12)
        ),
        alignment:Alignment.center,
        child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset("assets/icons/coins.png",
                  height: 20,
                  width: 20,
                  
                  ),
                  SizedBox(width: 10,),
                Text("500",style: TextsStyle.h5boldStyle(),)
                ],
              ),
              Container(
                height: 36,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: ColorConstant.bannerColor
                ),
                alignment: Alignment.center,
                child:  Text("80 Rs",style: TextsStyle.h5Style().apply(color: ColorConstant.blackColor),),
              )
            ],
          ),
        ),
      )
  
 , SizedBox(height: 20,),
 TextWidgets.descriptiveTag(text: 'Or')
   , SizedBox(height: 20,),
   Container(
    height: 60,
    width: MediaQuery.of(context).size.width/1,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: ColorConstant.bannerColor,
      border: Border.all(width: 1,color: ColorConstant.primaryColor)
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Image.asset("assets/icons/coins.png",
                  height: 28,
                  width: 28,
                  
                  ),

                                      SizedBox(width: 20,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidgets.h5LinkText(text: 'Get Free Coins')
                           ,
                           
                           SizedBox(height: 5,),
                            TextWidgets.descriptiveTag(text: "Watch Video and get 50 coins")
                            
                            ],
                          )
        ],
      ),
    ),
   )
    ],
  ),
)


                 
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
