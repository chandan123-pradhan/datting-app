import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/text_styles.dart';
import 'package:dating_app/widgets/botton_widget.dart';
import 'package:dating_app/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isToggleOn = true;
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
                TextWidgets.h5Text(text: 'Settings')
              ],
            ),
          ),
          Divider(
            color: ColorConstant.tinnyPrimaryColor,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Notifications",
                        style: TextsStyle.titleTextStyle()
                            .apply(color: ColorConstant.blackColor),
                      ),
                      // SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Allow notifications on your device",
                            style: TextsStyle.descriptionStyle()
                                .apply(color: ColorConstant.descriptiveColor),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isToggleOn = !isToggleOn;
                              });
                            },
                            child: SizedBox(
                              child: Icon(
                                isToggleOn == false
                                    ? Icons.toggle_off_outlined
                                    : Icons.toggle_on_sharp,
                                color: ColorConstant.primaryColor,
                                size: 45,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Privacy policy",
                            style: TextsStyle.titleTextStyle()
                                .apply(color: ColorConstant.blackColor),
                          ),
                          const Icon(
                            Icons.navigate_next,
                            size: 25,
                            color: ColorConstant.primaryColor,
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Terms & conditions",
                            style: TextsStyle.titleTextStyle()
                                .apply(color: ColorConstant.blackColor),
                          ),
                          const Icon(
                            Icons.navigate_next,
                            size: 25,
                            color: ColorConstant.primaryColor,
                          )
                        ],
                      ),

                      SizedBox(height: 50,),
                      BottonWidgets.mainBottonWithIcon(title: 'Logout',
                      onPressed: (){},
                      context: context,
                      icon: 'assets/icons/logout.png'
                      ),
 SizedBox(height: 20,),
Container(
  width: MediaQuery.of(context).size.width/1,
  alignment:Alignment.center,
  child:   Image.asset("assets/icons/delete_icon.png",
  height: 25,
  width: 123,
  
  ),
)

                    ],
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
