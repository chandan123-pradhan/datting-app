import 'package:dating_app/screens/auth_pages/verify_otp_page.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/image_utils.dart';
import 'package:dating_app/utils/string_utils.dart';
import 'package:dating_app/utils/text_styles.dart';
import 'package:dating_app/widgets/botton_widget.dart';
import 'package:dating_app/widgets/text_field_widgets.dart';
import 'package:dating_app/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProfileSetupPage extends StatefulWidget {
  const ProfileSetupPage({super.key});

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  int currentstep = 1;

  TextEditingController _mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height / 1,
        width: MediaQuery.of(context).size.width / 1,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
                child: Row(
                  children: [
                    BottonWidgets.backBottonWidget(onTap: () {}),
                  ],
                )),
            const SizedBox(
              height: 30,
            ),
            Visibility(
              visible: currentstep == 1,
              child: Column(
                children: [
                  TextWidgets.h2Tag(text: StringUtils.WHATS_YOUR_FULL_NAME),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: TextFieldWidgets.inputField(
                        hintText: StringUtils.FULL_NAME,
                        context: context,
                        textFieldController: _mobileNumberController),
                  ),
                ],
              ),
            ),
            
            
             Visibility(
              visible: currentstep == 2,
              child: Column(
                children: [
                  TextWidgets.h2Tag(text: StringUtils.WHATS_YOUR_BIRTHDAY),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: TextFieldWidgets.inputField(
                        hintText: StringUtils.FULL_NAME,
                        context: context,
                        textFieldController: _mobileNumberController),
                  ),
                ],
              ),
            ),
            
            
            
            Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 20, 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          TextWidgets.linkTextWidget(
                              linkText: '$currentstep', text: '', onTap: () {}),
                          TextWidgets.descriptiveTag(text: '/5'),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if(currentstep!=5){
                              currentstep++;
                            }
                          });
                        },
                        child: Image.asset(
                          "assets/icons/next_btn.png",
                          height: 40,
                          width: 40,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  LinearPercentIndicator(
                    lineHeight: 6.0,
                    percent: currentstep / 5,
                    backgroundColor: ColorConstant.tinnyPrimaryColor,
                    progressColor: ColorConstant.primaryColor,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
