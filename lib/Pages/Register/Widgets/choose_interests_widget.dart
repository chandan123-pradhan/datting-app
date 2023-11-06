// ignore_for_file: library_private_types_in_public_api

import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Pages/Register/Bloc/register_bloc.dart';
import 'package:dating_app/Pages/Register/Bloc/register_event.dart';
import 'package:dating_app/Pages/Register/Model/interest_response_model.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:flutter/material.dart';

class ChooseInterestsWidget extends StatefulWidget {
  final InterestResponseModel? interestResponseModel;
  final Function(int)? chooseInterest;
  final RegisterBloc? registerBloc;
  final bool? isLoading;
  const ChooseInterestsWidget(
      {super.key,
      required this.interestResponseModel,
      required this.chooseInterest,
      this.registerBloc,
      required this.isLoading});

  @override
  _ChooseInterestsWidgetState createState() => _ChooseInterestsWidgetState();
}

class _ChooseInterestsWidgetState extends State<ChooseInterestsWidget> {
  List<String> options = [
    '💃 Dancing',
    '🎮 Gaming',
    '🎬 Movie',
    '🎵 Music',
    '🍀 Nature',
    '📸 Photography',
    '📚 Reading',
    '🏛️ Architecture',
    "✍🏻 Writing",
    "👗 Fashion",
    "🗣️ Language",
    "💪🏻 Gym & Fitness",
    "🐶 Animals"
  ];
  List<bool> selected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.registerBloc?.add(GetInterestEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            if ((widget.interestResponseModel?.data ?? []).isNotEmpty)
              const SizedBox(
                height: SizeConstants.mediumPadding,
              ),
            if ((widget.interestResponseModel?.data ?? []).isNotEmpty)
              Text(
                StringConstants.interests,
                style: ThemeConfiguration.registerHeadingTextStyle(),
              ),
            if ((widget.interestResponseModel?.data ?? []).isNotEmpty)
              const SizedBox(
                height: SizeConstants.bigPadding,
              ),
            if ((widget.interestResponseModel?.data ?? []).isNotEmpty)
              GridView.builder(
                itemCount: (widget.interestResponseModel?.data??[]).length ?? 0,
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
                      widget.chooseInterest!(index);
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
                            widget.interestResponseModel?.data?[index].intrest ??
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
            if ((widget.interestResponseModel?.data ?? []).isEmpty&&widget.isLoading==false)
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
          ],
        ),
      ),
    );
  }
}
