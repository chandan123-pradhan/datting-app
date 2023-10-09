import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Pages/Dashboard/View/dashboard_view.dart';
import 'package:dating_app/Pages/Otp/Widgets/otp_header_widget.dart';
import 'package:dating_app/Utilities/common_widgets.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OtpView extends StatefulWidget {
  final String? mobileNumber;
  const OtpView({super.key, required this.mobileNumber});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  TextEditingController mobileNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfiguration.scaffoldBgColor,
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const SizedBox(
                    height: SizeConstants.maximumPadding +
                        SizeConstants.maximumPadding +
                        SizeConstants.maximumPadding,
                  ),
                  OtpHeaderWidget(
                      mobileNumberController: mobileNumberController),
                                      const SizedBox(
                    height: SizeConstants.maximumPadding+
                        SizeConstants.maximumPadding,
                  ), Padding(
                       padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
                       child: CommonWidgets.mainBotton(
                               title: StringConstants.verify,
                               context: context,
                               onPressed: (){
                                  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const DashboardView();
                          },
                        ),
                      );
                               }),
                     ),
      const SizedBox(
        height: SizeConstants.maximumPadding,
      ), ]),
                CommonWidgets.backBottonWidget(onTap: () {
                  Navigator.pop(context);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
