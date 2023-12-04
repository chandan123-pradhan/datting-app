import 'package:dating_app/CommonWidgets/emptry_widget.dart';
import 'package:dating_app/CommonWidgets/grid_shimer_widget.dart';
import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Helper/navigation_helper.dart';
import 'package:dating_app/Pages/Dashboard/controllers/dashboard_controllers.dart';
import 'package:dating_app/Pages/InterestedInYou/Widgets/profile_card_widget.dart';
// import 'package:dating_app/Pages/InterestedInYou/controller/intrested_in_you_controller.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterestedInYouView extends StatefulWidget {
  const InterestedInYouView({super.key});

  @override
  State<InterestedInYouView> createState() => _InterestedInYouViewState();
}

class _InterestedInYouViewState extends State<InterestedInYouView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(), child: headerWidget()),
            bodyWidget(context),
          ],
        ),
      ),
    );
  }
}

class headerWidget extends StatelessWidget {
  const headerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 50,
        color: ThemeConfiguration.primaryColor,
      ),
      Stack(
        children: [
          // Image.asset(ImageConstants.interedInYouAppBar),
          Container(
            height: MediaQuery.of(context).size.height / 7,
            width: MediaQuery.of(context).size.width / 1,
            decoration: const BoxDecoration(
                color: ThemeConfiguration.primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                        SizeConstants.textFieldCardBorderRadius),
                    bottomRight: Radius.circular(
                        SizeConstants.textFieldCardBorderRadius))),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageConstants.heartIcon,
                  height: SizeConstants.msgIconHeight,
                  color: ColorConstant.whiteColor,
                ),
                const SizedBox(
                  width: SizeConstants.mediumPadding,
                ),
                const Text(
                  StringConstants.interestedinYou,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: ColorConstant.whiteColor),
                )
              ],
            )),
          ),
        ],
      ),
    ]);
  }
}

Widget bodyWidget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
    child: GetBuilder<DashboardControllers>(
        init: DashboardControllers(),
        builder: (controller) {
          return controller.intrestedInYouApiResponse == null
              ? const Center(child: GridShimerWidget())
              : SingleChildScrollView(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: controller.intrestedInYouApiResponse!.data.isNotEmpty
                        ? const EmptryWidget()
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.8,
                              mainAxisSpacing: SizeConstants.mediumPadding,
                              crossAxisSpacing: SizeConstants.mediumPadding,
                            ),
                            itemCount: controller
                                .intrestedInYouApiResponse!.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ProfileCardWidget(
                                intrestedPersonData: controller
                                    .intrestedInYouApiResponse!.data[index],
                              );
                            }),
                  ),
                );
        }),
  );
}
