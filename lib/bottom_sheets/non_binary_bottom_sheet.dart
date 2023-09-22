import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/string_utils.dart';
import 'package:dating_app/utils/text_styles.dart';
import 'package:dating_app/widgets/text_widgets.dart';
import 'package:flutter/material.dart';


class NonBinaryBottomSheetDialog extends StatefulWidget {
  const NonBinaryBottomSheetDialog({super.key});

  @override
  State<NonBinaryBottomSheetDialog> createState() => _NonBinaryBottomSheetDialogState();
}

class _NonBinaryBottomSheetDialogState extends State<NonBinaryBottomSheetDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/1.3,
      decoration: const BoxDecoration(
        color: ColorConstant.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
        StringUtils.ADD_MORE_ABOUT_YOUR_GENDER,
        textAlign: TextAlign.center,
        style: TextsStyle.h1Style(),
      ),
      SizedBox(height: 10,),
    TextWidgets.descriptiveTag(text: StringUtils.GENDER_DESCRIPTION)
           
          ],
        ),
      ),
    );
  }
}