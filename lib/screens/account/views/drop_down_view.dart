import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/constants.dart';
import 'package:dating_app/utils/image_utils.dart';
import 'package:flutter/material.dart';

class DropDownView extends StatefulWidget {
  final bool? isShowEditButton, isShowDownloadButton;

  const DropDownView(
      {super.key,
      this.isShowEditButton = true,
      this.isShowDownloadButton = false});

  @override
  _DropDownViewState createState() => _DropDownViewState();
}

class _DropDownViewState extends State<DropDownView> {
  String selectedValue = 'Option 1';
  List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Container(
      width: deviceSize.width / 1,
      decoration: BoxDecoration(
        color: ColorConstant.profileContainerBgColor,
        border: Border.all(color: ColorConstant.primaryColor),
        borderRadius: BorderRadius.circular(Constant.normalCardBorderRadius),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          icon: const Icon(null),
          underline: Container(
            height: 0,
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue ?? '';
            });
          },
          items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Constant.maximumPadding,
                  vertical: Constant.mediumPadding,
                ),
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(value),
                          if (widget.isShowEditButton == true)
                            const SizedBox(
                              width: Constant.mediumPadding,
                            ),
                          if (widget.isShowEditButton == true)
                            Image.asset(
                              ImageUtils.editButton,
                              height: 14,
                              width: 14,
                            ),
                        ],
                      ),
                      Row(
                        children: [
                          if (widget.isShowDownloadButton == false)
                            const Icon(
                              Icons.navigate_next,
                              color: ColorConstant.primaryColor,
                            ),
                          if (widget.isShowDownloadButton == true)
                            Image.asset(
                              ImageUtils.downloadButton,
                              height: 18,
                              width: 18,
                            ),
                        ],
                      )
                    ]),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
