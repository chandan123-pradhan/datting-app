// import 'package:dating_app/common_widgets/common_app_bar.dart';
// import 'package:dating_app/screens/account/views/profile_body_card.dart';
// import 'package:dating_app/screens/account/views/profile_card_view.dart';
// import 'package:dating_app/screens/edit_account/edit_account_screen.dart';
// import 'package:dating_app/utils/color_constant.dart';
// import 'package:dating_app/utils/constants.dart';
// import 'package:dating_app/utils/string_utils.dart';
// import 'package:dating_app/utils/text_styles.dart';
// import 'package:dating_app/widgets/botton_widget.dart';
// import 'package:flutter/material.dart';

// class AccountScreen extends StatefulWidget {
//   const AccountScreen({super.key});

//   @override
//   State<AccountScreen> createState() => _AccountScreenState();
// }

// class _AccountScreenState extends State<AccountScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: ColorConstant.scaffoldBgColor,
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(50.0),
//           child: CommonAppBar(
//             title: StringUtils.profile,
//             onEdit: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const EditAccountScreen()),
//               );
//             },
//             onSetting: () {},
//             editShow: true,
//             settingShow: true,
//           ),
//         ),
//         body: const SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(Constant.mainPagePadding),
//             child: Column(children: [
//               ProfileCardView(),
//               SizedBox(height: Constant.maximumPadding),
//               ProfileBodyCard(
//                 isFromEdit: false,
//               ),
//               SizedBox(
//                 height: Constant.maximumPadding +
//                     Constant.maximumPadding +
//                     Constant.maximumPadding +
//                     Constant.maximumPadding +
//                     Constant.maximumPadding,
//               ),
//             ]),
//           ),
//         ));
//   }
// }
