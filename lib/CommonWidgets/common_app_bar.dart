import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/constants.dart';
import 'package:dating_app/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  final String? title;
  final bool? isShowDivider;
  final bool? editShow;
  final bool? settingShow;
  final bool? isBack;
  final onEdit;
  final onSetting;
  const CommonAppBar(
      {super.key,
      required this.title,
      this.isShowDivider = false,
      this.editShow = false,
      this.settingShow = false,
      this.isBack = false,
      this.onEdit,
      required this.onSetting});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstant.scaffoldBgColor,
      elevation: 0,
      leading: isBack == true
          ? Padding(
              padding: const EdgeInsets.only(left: Constant.mainPagePadding),
              child: CommonWidgets.backBottonWidget(onTap: () {
                Navigator.pop(context);
              }),
            )
          : Container(),
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        title ?? "",
        style: TextStyles.commonAppbarTitleStyle(),
      ),
      actions: [
        if (editShow == true)
          InkWell(
            onTap: onEdit,
            child: Icon(
              Icons.edit_outlined,
              color: ColorConstant.primaryColor,
            ),
          ),
        SizedBox(
          width: Constant.maximumPadding,
        ),
        if (settingShow == true)
          InkWell(
            onTap: onSetting,
            child: Icon(
              Icons.settings_outlined,
              color: ColorConstant.primaryColor,
            ),
          ),
        SizedBox(
          width: Constant.maximumPadding,
        ),
      ],
    );
  }
}
