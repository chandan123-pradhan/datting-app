// import 'package:dating_app/utils/color_constant.dart';
// import 'package:dating_app/utils/string_utils.dart';
// import 'package:dating_app/utils/text_styles.dart';
// import 'package:dating_app/widgets/botton_widget.dart';
// import 'package:dating_app/widgets/radio_bottom_widget.dart';
// import 'package:dating_app/widgets/text_widgets.dart';
// import 'package:flutter/material.dart';

// class NonBinaryBottomSheetDialog extends StatefulWidget {
//   const NonBinaryBottomSheetDialog({super.key});

//   @override
//   State<NonBinaryBottomSheetDialog> createState() =>
//       _NonBinaryBottomSheetDialogState();
// }

// class _NonBinaryBottomSheetDialogState
//     extends State<NonBinaryBottomSheetDialog> {

// List<String>titleList=[
//   StringUtils.Intersex_Woman,
//   StringUtils.TRANSFEMINING,
//   StringUtils.TRANS_WOMAN,
//   StringUtils.WomanAndNonBinary,
//   StringUtils.CIS_WOMAN,
//   StringUtils.TELL_US_IF_WE_ARE_MISSING
// ];

// int currentIndex=2;


//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // height: MediaQuery.of(context).size.height / 1.3,
//       decoration: const BoxDecoration(
//           color: ColorConstant.backgroundColor,
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20), topRight: Radius.circular(20))),
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Text(
//                 StringUtils.ADD_MORE_ABOUT_YOUR_GENDER,
//                 textAlign: TextAlign.center,
//                 style: TextsStyle.h1Style(),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextWidgets.descriptiveTag(text: StringUtils.GENDER_DESCRIPTION),
//               const SizedBox(
//                 height: 30,
//               ),
//               Divider(),
//              for(int i=0;i<titleList.length;i++)
//                InkWell(
//                 onTap: (){
//         setState(() {
//           currentIndex=i;
//         });
//                 },
//                  child: Column(
//                    children: [
//                      RadioBottomWidget(
//                           status: i==currentIndex?true:false,
//                           title: titleList[i],
//                           context: context),
//                           const SizedBox(height: 10,),
           
//                Divider(),
//                SizedBox(height: 5,)
                           
//                    ],
//                  ),
//                ),
              
        
//           BottonWidgets.mainBotton(
//                         title: StringUtils.SaveAndClose,
//                         context: context,
//                         onPressed: () {
//                           Navigator.pop(context);
//                         }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
