import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OtpHeaderWidget extends StatefulWidget {
  const OtpHeaderWidget({
    super.key,
    required this.mobileNumberController,
  });

  final TextEditingController mobileNumberController;

  @override
  State<OtpHeaderWidget> createState() => _OtpHeaderWidgetState();
}

class _OtpHeaderWidgetState extends State<OtpHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    bool? timerEnd = false;
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
              "999999XXXX",
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
            timerEnd == true
                ? InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Resend Otp",
                      style: ThemeConfiguration.subHeadingTextStyle(),
                    ),
                  )
                : Countdown(
                    seconds: 60,
                    build: (BuildContext context, double time) =>
                        Text('00:${time.toStringAsFixed(0)}'),
                    interval: const Duration(seconds: 1),
                    onFinished: () {
                      setState(() {
                        timerEnd = true;
                      });
                      print('Timer is done!');
                    },
                  ),
          ],
        ),
        const SizedBox(
          height: SizeConstants.bigPadding,
        ),
        if (timerEnd == true)
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
          child: CommonWidgets.otpTextField(inputFieldLength: 4),
        ),
      ],
    );
  }
}
