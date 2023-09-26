import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/constants.dart';
import 'package:dating_app/utils/text_styles.dart';
import 'package:dating_app/widgets/botton_widget.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  final String? title;
  final bool? isShowDivider;
  final bool? editShow;
  final bool? settingShow;
  final onEdit;
  final onSetting;
  const CommonAppBar(
      {super.key, required this.title, this.isShowDivider = false,this.editShow=false,this.settingShow=false, this.onEdit,required this.onSetting});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Constant.customAppBarHeight,
          width: MediaQuery.of(context).size.width / 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottonWidgets.backBottonWidget(onTap: () {}),
              Text(
                title ?? "",
                style: TextStyles.commonAppbarTitleStyle(),
              ),
              Row(
                children:  [
                  if(editShow==true)
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

                  if(editShow==true)
                                   InkWell(
                    onTap: onSetting,
                    child: Icon(
                      Icons.settings_outlined,
                      color: ColorConstant.primaryColor,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        if (isShowDivider == true)
          const Divider(
            color: ColorConstant.tinnyPrimaryColor,
          ),
      ],
    );
  }
}
