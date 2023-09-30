// import 'package:dating_app/screens/account/views/drop_down_view.dart';
// import 'package:dating_app/screens/account/views/option_card_view.dart';
// import 'package:dating_app/utils/constants.dart';
// import 'package:dating_app/utils/string_utils.dart';
// import 'package:flutter/material.dart';

// class OptionsView extends StatefulWidget {
//   const OptionsView({super.key});

//   @override
//   State<OptionsView> createState() => _OptionsViewState();
// }

// class _OptionsViewState extends State<OptionsView> {
//   @override
//   Widget build(BuildContext context) {
//     List<String> title = [
//       StringUtils.profile,
//       StringUtils.personalDetail,
//       StringUtils.yourIntrest,
//       StringUtils.yourBio,
//       StringUtils.notificationSetting,
//       StringUtils.privacyPolicy,
//       StringUtils.termsAndConditions,
//     ];
//     List<bool> isShowEditButton = [
//       true,
//       true,
//       true,
//       true,
//       false,
//       false,
//       false,
//     ];
//     List<bool> isShowDownloadButton = [
//       false,
//       false,
//       false,
//       false,
//       false,
//       true,
//       true,
//     ];
//     List<bool> isShowDetail = [
//       false,
//       false,
//       false,
//       false,
//       false,
//       false,
//       false,
//     ];

//     return ListView.builder(
//         itemCount: title.length,
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemBuilder: (BuildContext context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(bottom: Constant.maximumPadding),
//             child: InkWell(
//               onTap: () {
//                 //print(isShowDetail[index]);
//                 setState(() {
//                   print("Test log ==> This is working fine");
//                   setState(() {
//                     // isShowDetail.insert(index, true);
//                     isShowDetail[index] = !isShowDetail[index];
//                   });
//                   // if (isShowDetail[index]) {
//                   //   setState(() {
//                   //     isShowDetail.insert(index, true);
//                   //   });
//                   // } else {
//                   //   isShowDetail.insert(index, false);
//                   // }
//                   //  isShowDetail[index]=isShowDetail[index]==true?false:true;
//                 });
//                 print(isShowDetail[index]);
//               },
//               //  child: DropDownView(),
//               child: Column(
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       //print(isShowDetail[index]);
//                       setState(() {
//                         print("Test log ==> This is working fine");
//                         setState(() {
//                           // isShowDetail.insert(index, true);
//                           isShowDetail[index] = !isShowDetail[index];
//                         });
//                         // if (isShowDetail[index]) {
//                         //   setState(() {
//                         //     isShowDetail.insert(index, true);
//                         //   });
//                         // } else {
//                         //   isShowDetail.insert(index, false);
//                         // }
//                         //  isShowDetail[index]=isShowDetail[index]==true?false:true;
//                       });
//                       print(isShowDetail[index]);
//                     },
//                     //  child: DropDownView(),
//                     child: OptionCardView(
//                       title: title[index],
//                       isShowEditButton: isShowEditButton[index],
//                       isShowDownloadButton: isShowDownloadButton[index],
//                     ),
//                   ),
//                   if (isShowDetail[index] == true)
//                     Container(
//                       height: 100,
//                       decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(
//                                   Constant.normalCardBorderRadius),
//                               bottomRight: Radius.circular(
//                                   Constant.normalCardBorderRadius))),
//                     ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }
