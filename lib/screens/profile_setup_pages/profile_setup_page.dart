// import 'package:dating_app/bottom_sheets/non_binary_bottom_sheet.dart';
// import 'package:dating_app/screens/auth_pages/verify_otp_page.dart';
// import 'package:dating_app/screens/dashboard_screens/dashbaord_screen.dart';
// import 'package:dating_app/Pages/Register/Widgets/choose_intrest_view.dart';
// import 'package:dating_app/Pages/Register/Widgets/upload_photos_view.dart';
// import 'package:dating_app/utils/color_constant.dart';
// import 'package:dating_app/utils/constants.dart';
// import 'package:dating_app/utils/image_utils.dart';
// import 'package:dating_app/utils/string_utils.dart';
// import 'package:dating_app/utils/text_styles.dart';
// import 'package:dating_app/widgets/botton_widget.dart';
// import 'package:dating_app/widgets/text_field_widgets.dart';
// import 'package:dating_app/widgets/text_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';

// class ProfileSetupPage extends StatefulWidget {
//   const ProfileSetupPage({super.key});

//   @override
//   State<ProfileSetupPage> createState() => _ProfileSetupPageState();
// }

// class _ProfileSetupPageState extends State<ProfileSetupPage> {
//   int currentstep = 1;

//   TextEditingController _mobileNumberController = TextEditingController();

//   List<int> days = List<int>.generate(31, (index) => index + 1);
//   List<int> months = List<int>.generate(12, (index) => index + 1);
//   int? selectedDays;
//   int? selectedMonth;

//   List<String> yearList = [
//     '1995',
//     '1996',
//     '1997',
//     '1998',
//     '1999',
//     '2000',
//     '2001',
//     '2002',
//     '2003',
//     '2004',
//     '2005',
//     '2006'
//   ];
//   String? selectedYear;
//   String selectedGender = 'women';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConstant.backgroundColor,
//       body: Container(
//         height: MediaQuery.of(context).size.height / 1,
//         width: MediaQuery.of(context).size.width / 1,
//         child: Column(
//           children: [
//             Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
//                 child: Row(
//                   children: [
//                     BottonWidgets.backBottonWidget(onTap: () {
//                       if (currentstep == 1) {
//                         Navigator.pop(context);
//                       } else {
//                         currentstep--;
//                         setState(() {});
//                       }
//                     }),
//                   ],
//                 )),
//             const SizedBox(
//               height: 30,
//             ),
//             Visibility(
//               visible: currentstep == 1,
//               child: Column(
//                 children: [
//                   TextWidgets.h2Tag(text: StringUtils.WHATS_YOUR_FULL_NAME),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
//                     child: TextFieldWidgets.inputField(
//                         textInputType: TextInputType.name,
//                         hintText: StringUtils.FULL_NAME,
//                         context: context,
//                         textFieldController: _mobileNumberController),
//                   ),
//                 ],
//               ),
//             ),
//             Visibility(
//               visible: currentstep == 2,
//               child: Column(
//                 children: [
//                   TextWidgets.h2Tag(text: StringUtils.WHATS_YOUR_BIRTHDAY),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Container(
//                             height: Constant.mainBottonHeight,
//                             width: MediaQuery.of(context).size.width / 5,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 border: Border.all(
//                                     width: 1, color: ColorConstant.linkColor)),
//                             alignment: Alignment.center,
//                             child: DropdownButton<int>(
//                               underline: Container(),
//                               value: selectedDays,
//                               hint: TextWidgets.descriptiveTag(text: 'DD'),
//                               items: List<DropdownMenuItem<int>>.generate(31,
//                                   (int index) {
//                                 return DropdownMenuItem<int>(
//                                   value: index + 1,
//                                   child: Text('${index + 1}'),
//                                 );
//                               }),
//                               onChanged: (newValue) {
//                                 setState(() {
//                                   selectedDays = newValue!;
//                                 });
//                               },
//                             ),
//                           ),
//                           Container(
//                             height: Constant.mainBottonHeight,
//                             width: MediaQuery.of(context).size.width / 5,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 border: Border.all(
//                                     width: 1, color: ColorConstant.linkColor)),
//                             alignment: Alignment.center,
//                             child: DropdownButton<int>(
//                               underline: Container(),
//                               value: selectedMonth,
//                               hint: TextWidgets.descriptiveTag(text: 'MM'),
//                               items: List<DropdownMenuItem<int>>.generate(12,
//                                   (int index) {
//                                 return DropdownMenuItem<int>(
//                                   value: index + 1,
//                                   child: Text('${index + 1}'),
//                                 );
//                               }),
//                               onChanged: (newValue) {
//                                 setState(() {
//                                   selectedMonth = newValue!;
//                                 });
//                               },
//                             ),
//                           ),
//                           Container(
//                             height: Constant.mainBottonHeight,
//                             width: MediaQuery.of(context).size.width / 3,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 border: Border.all(
//                                     width: 1, color: ColorConstant.linkColor)),
//                             alignment: Alignment.center,
//                             child: DropdownButton<String>(
//                               underline: Container(),
//                               value: selectedYear,
//                               hint: TextWidgets.descriptiveTag(text: 'YEAR'),
//                               items: yearList.map<DropdownMenuItem<String>>(
//                                   (String value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Text(value),
//                                 );
//                               }).toList(),
//                               onChanged: (newValue) {
//                                 setState(() {
//                                   selectedYear = newValue!;
//                                 });
//                               },
//                             ),
//                           )
//                         ],
//                       )),
//                 ],
//               ),
//             ),
//             Visibility(
//               visible: currentstep == 3,
//               child: Column(
//                 children: [
//                   TextWidgets.h2Tag(text: StringUtils.Whats_YOUR_GENDER),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   setState(() {
//                                     selectedGender = 'man';
//                                   });
//                                 },
//                                 child: Stack(
//                                   alignment: Alignment.center,
//                                   children: [
//                                     Container(
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(15),
//                                             border: selectedGender == 'man'
//                                                 ? Border.all(
//                                                     width: 1,
//                                                     color:
//                                                         ColorConstant.linkColor)
//                                                 : Border.all(
//                                                     width: 1,
//                                                     color: Colors.transparent)),
//                                         height: 144,
//                                         width:
//                                             MediaQuery.of(context).size.width /
//                                                 2.8,
//                                         alignment: Alignment.center,
//                                         child: Image.asset(
//                                           ImageUtils.man_icon,
//                                           height: 56,
//                                           width: 56,
//                                         )),
//                                     Positioned(
//                                         bottom: 20,
//                                         child: TextWidgets.blackTextTitle(
//                                             text: StringUtils.MALE)),
//                                   ],
//                                 ),
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   setState(() {
//                                     selectedGender = 'women';
//                                   });
//                                 },
//                                 child: Stack(
//                                   alignment: Alignment.center,
//                                   children: [
//                                     Container(
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(15),
//                                           border: selectedGender == 'women'
//                                               ? Border.all(
//                                                   width: 1,
//                                                   color:
//                                                       ColorConstant.linkColor)
//                                               : Border.all(
//                                                   width: 1,
//                                                   color: Colors.transparent)),
//                                       height: 144,
//                                       width: MediaQuery.of(context).size.width /
//                                           2.8,
//                                       alignment: Alignment.center,
//                                       child: Image.asset(
//                                         ImageUtils.women_icon,
//                                         height: 56,
//                                         width: 56,
//                                       ),
//                                     ),
//                                     Positioned(
//                                         bottom: 20,
//                                         child: TextWidgets.blackTextTitle(
//                                             text: StringUtils.FEMALE)),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 30,
//                           ),
//                           InkWell(
//                             onTap: () {
//                               setState(() {
//                                 selectedGender = 'others';
//                               });
//                               showModalBottomSheet(
//                                   //barrierColor: Colors.,
//                                   isScrollControlled: true,
//                                   elevation: 0.0,
//                                   enableDrag: true,
//                                   shape: const RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.only(
//                                           topLeft: Radius.circular(20),
//                                           topRight: Radius.circular(20))),
//                                   context: context,
//                                   builder: (context) {
//                                     return const NonBinaryBottomSheetDialog();
//                                   });
//                             },
//                             child: Stack(
//                               alignment: Alignment.center,
//                               children: [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(15),
//                                       border: selectedGender == 'others'
//                                           ? Border.all(
//                                               width: 1,
//                                               color: ColorConstant.linkColor)
//                                           : Border.all(
//                                               width: 1,
//                                               color: Colors.transparent)),
//                                   height: 144,
//                                   width:
//                                       MediaQuery.of(context).size.width / 2.8,
//                                   alignment: Alignment.center,
//                                   child: Image.asset(
//                                     ImageUtils.other_icon,
//                                     height: 56,
//                                     width: 56,
//                                   ),
//                                 ),
//                                 Positioned(
//                                     bottom: 20,
//                                     child: TextWidgets.blackTextTitle(
//                                         text: StringUtils.NON_BINARY)),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ))
//                 ],
//               ),
//             ),
//            Expanded(
//                 child: Padding(
//               padding: const EdgeInsets.fromLTRB(30, 0, 20, 40),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           TextWidgets.linkTextWidget(
//                               linkText: '$currentstep', text: '', onTap: () {}),
//                           TextWidgets.descriptiveTag(text: '/5'),
//                         ],
//                       ),
//                       InkWell(
//                         onTap: () {
//                           setState(() {
//                             if (currentstep != 5) {
//                               currentstep++;
//                             } else {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) {
//                                     return DashboardScreen();
//                                   },
//                                 ),
//                               );
//                             }
//                           });
//                         },
//                         child: Image.asset(
//                           "assets/icons/next_btn.png",
//                           height: 40,
//                           width: 40,
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   LinearPercentIndicator(
//                     lineHeight: 6.0,
//                     percent: currentstep / 5,
//                     backgroundColor: ColorConstant.tinnyPrimaryColor,
//                     progressColor: ColorConstant.primaryColor,
//                   ),
//                 ],
//               ),
//             ))
//           ],
//         ),
//       ),
//     );
//   }
// }
