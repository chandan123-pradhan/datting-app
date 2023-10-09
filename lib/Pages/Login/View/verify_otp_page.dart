// import 'package:dating_app/Configurations/theme_configuration.dart';
// import 'package:dating_app/Utilities/common_widgets.dart';
// import 'package:dating_app/screens/profile_setup_pages/profile_setup_page.dart';
// import 'package:dating_app/utils/color_constant.dart';
// import 'package:dating_app/utils/image_utils.dart';
// import 'package:dating_app/utils/string_utils.dart';
// import 'package:dating_app/utils/text_styles.dart';
// import 'package:dating_app/widgets/botton_widget.dart';
// import 'package:dating_app/widgets/text_field_widgets.dart';
// import 'package:dating_app/widgets/text_widgets.dart';
// import 'package:flutter/material.dart';

// class VerifyOpt extends StatefulWidget {
//   final String mobileNumber;
//   VerifyOpt({required this.mobileNumber});

//   @override
//   State<VerifyOpt> createState() => _VerifyOptState();
// }

// class _VerifyOptState extends State<VerifyOpt> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ThemeConfiguration.scaffoldBgColor,
//       body: Container(
//         height: MediaQuery.of(context).size.height / 1,
//         width: MediaQuery.of(context).size.width / 1,
//         child: Column(
//           children: [
//             Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
//                 child: Row(
//                   children: [
//                     CommonWidgets.backBottonWidget(onTap: () {
//                       Navigator.pop(context);
//                     }),
//                   ],
//                 )),
//             TextWidgets.h1Tag(text: StringUtils.VERIFY_LOGIN),
//             const SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//               child: TextWidgets.descriptiveTag(
//                   text:
//                       'Enter OTP code we sent to ${widget.mobileNumber} This code will expired in 01:30 '),
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             Padding(
//               padding: EdgeInsets.all(20),
//               child: TextFieldWidgets.otpTextField(inputFieldLength: 4),
//             ),
//             Expanded(
//                 child: Padding(
//               padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   CommonWidgets.mainBotton(
//                       title: StringUtils.VERIFY,
//                       context: context,
//                       onPressed: () {
//                         // Navigator.push(context, MaterialPageRoute(builder: (context){
//                         //   return const ProfileSetupPage();
//                         // }));
//                       }),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   TextWidgets.linkTextWidget(
//                       linkText: StringUtils.SIGN_UP,
//                       text: StringUtils.DONT_HAVE_ACCOUNT,
//                       onTap: () {
//                         print("link taped");
//                       })
//                 ],
//               ),
//             ))
//           ],
//         ),
//       ),
//     );
//   }
// }
