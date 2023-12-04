// ignore_for_file: library_private_types_in_public_api

import 'package:dating_app/CommonWidgets/common_btn.dart';
import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Pages/Edit%20Account/Bloc/edit_account_bloc.dart';
import 'package:dating_app/Pages/Register/Model/interest_response_model.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/CommonWidgets/common_app_bar.dart';
import 'package:flutter/material.dart';

class EditInterestWidget extends StatefulWidget {
  final List<String>? interestList;
  final InterestResponseModel? interestResponseModel;
  final Function(List<String>)? chooseInterest;
  const EditInterestWidget(
      {super.key,
      required this.interestList,
      required this.interestResponseModel,
      this.chooseInterest});

  @override
  _EditInterestWidgetState createState() => _EditInterestWidgetState();
}

class _EditInterestWidgetState extends State<EditInterestWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfiguration.scaffoldBgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: CommonAppBar(
          title: StringConstants.interests,
          onEdit: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => const EditAccountScreen()),
            // );
          },
          onSetting: () {},
          editShow: false,
          settingShow: false,
          isBack: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if ((widget.interestResponseModel?.data ?? []).isNotEmpty)
                GridView.builder(
                  itemCount:
                      (widget.interestResponseModel?.data ?? []).length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 3,
                      mainAxisSpacing: SizeConstants.mediumPadding,
                      crossAxisSpacing: SizeConstants.mediumPadding),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          widget.interestResponseModel?.data?[index]
                              .isSelected = !(widget.interestResponseModel
                                  ?.data?[index].isSelected ??
                              false);
                          print(widget
                              .interestResponseModel?.data?[index].isSelected);
                          if (widget.interestResponseModel?.data?[index]
                                  .isSelected ==
                              true) {
                            if (widget.interestList != []) {
                              widget.interestList?.add(widget
                                      .interestResponseModel?.data?[index].id ??
                                  "");
                            } else {
                              widget.interestList?.forEach((element) {
                                if (element.toString() ==
                                    widget
                                        .interestResponseModel?.data?[index].id
                                        .toString()) {
                                } else {
                                  widget.interestList?.add(widget
                                          .interestResponseModel
                                          ?.data?[index]
                                          .id ??
                                      "");
                                }
                              });
                            }
                            print(widget.interestList);
                          } else {
                            widget.interestList?.remove(
                                widget.interestResponseModel?.data?[index].id ??
                                    "");
                            print(widget.interestList);
                          }
                        });
                      },
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          decoration: BoxDecoration(
                              color: widget.interestResponseModel?.data?[index]
                                          .isSelected ==
                                      true
                                  ? ThemeConfiguration.primaryLightColor
                                      .withOpacity(0.3)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(35.0),
                              border: Border.all(
                                color: ThemeConfiguration.primaryColor,
                              )),
                          child: Center(
                            child: Text(
                              widget.interestResponseModel?.data?[index]
                                      .intrest ??
                                  '',
                              style: const TextStyle(
                                  color: ThemeConfiguration.descriptiveColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              if ((widget.interestResponseModel?.data ?? []).isEmpty)
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 4),
                  child: Center(
                    child: Text(
                      StringConstants.noInterestsFound,
                      style: ThemeConfiguration.subHeadingTextStyle(),
                    ),
                  ),
                ),
              const SizedBox(
                height:
                    SizeConstants.maximumPadding + SizeConstants.mediumPadding,
              ),
              commonButton(
                onButtonTap: () {
                  Navigator.pop(context, widget.interestList);
                },
                context: context,
              ),
              const SizedBox(
                height: SizeConstants.maximumPadding +
                    SizeConstants.maximumPadding +
                    SizeConstants.maximumPadding,
              )
            ],
          ),
        ),
      ),
    );
  }
}
