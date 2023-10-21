import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OtpHeaderWidget extends StatefulWidget {
  const OtpHeaderWidget({
    super.key,
    required this.mobileNumber,
    required this.callBack,
    required this.updateTimerActiveCallback,
    required this.timerActive,
  });

  final String mobileNumber;
  final Function(String) callBack;
  final Function(bool) updateTimerActiveCallback;
  final bool timerActive;

  @override
  State<OtpHeaderWidget> createState() => _OtpHeaderWidgetState();
}

class _OtpHeaderWidgetState extends State<OtpHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: SizeConstants.mediumPadding,
        ),
        Text(
          StringConstants.otp,
          style: ThemeConfiguration.headingTextStyle(),
        ),
        const SizedBox(
          height: SizeConstants.mediumPadding,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StringConstants.otpSubtitle1,
              style: ThemeConfiguration.subHeadingTextStyle(),
            ),
            Text(
              widget.mobileNumber.toString(),
              style: ThemeConfiguration.subHeadingTextStyle(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StringConstants.otpSubtitle2,
              style: ThemeConfiguration.subHeadingTextStyle(),
            ),
            Countdown(
              seconds: widget.timerActive ? 60 : 0,
              build: (BuildContext context, double time) {
                if (widget.timerActive) {
                  return Text('00:${time.toStringAsFixed(0)}');
                } else {
                  return const Text('Resend');
                }
              },
              interval: const Duration(seconds: 1),
              onFinished: (timer) {
                widget.updateTimerActiveCallback(false);
              },

            ),
          ],
        ),
        const SizedBox(
          height: SizeConstants.bigPadding,
        ),
        if (widget.timerActive == false)
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              "Resend Otp",
              style: ThemeConfiguration.subHeadingTextStyle(),
            ),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: CommonWidgets.otpTextField(
              inputFieldLength: 4,
              callBack: (pin) {
                widget.callBack(pin);
              }),
        ),
      ],
    );
  }
}
