import 'package:dating_app/screens/auth_pages/verify_otp_page.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/image_utils.dart';
import 'package:dating_app/utils/string_utils.dart';
import 'package:dating_app/utils/text_styles.dart';
import 'package:dating_app/widgets/botton_widget.dart';
import 'package:dating_app/widgets/text_field_widgets.dart';
import 'package:dating_app/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            TextWidgets.h1Tag(text: StringUtils.Login),
            const SizedBox(
              height: 10,
            ),
            TextWidgets.descriptiveTag(
                text: StringUtils.ENTER_YOUR_PHONE_NUMBER_TO_LOGIN),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFieldWidgets.mobileNumberInputTextField(
                  context: context,
                  textFieldController: _mobileNumberController),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  BottonWidgets.mainBotton(
                      title: StringUtils.Login,
                      context: context,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return VerifyOpt(
                                mobileNumber: _mobileNumberController.text,
                              );
                            },
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  TextWidgets.linkTextWidget(
                      linkText: StringUtils.SIGN_UP,
                      text: StringUtils.DONT_HAVE_ACCOUNT,
                      onTap: () {
                        print("link taped");
                      })
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
