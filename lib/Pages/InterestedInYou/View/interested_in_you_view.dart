import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Pages/InterestedInYou/Widgets/profile_card_widget.dart';
import 'package:dating_app/Pages/InterestedInYou/controller/intrested_in_you_controller.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
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
          Image.asset(ImageConstants.interedInYouAppBar),
          Container(
            height: 60,
            color: ThemeConfiguration.primaryColor,
            width: 60,
          ),
        ],
      ),
    ]);
  }
}

Widget bodyWidget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(SizeConstants.mainPagePadding),
    child: GetBuilder<IntrestedInYouController>(
      init: IntrestedInYouController(),
      builder: (controller) {
        return 
        
      controller.intrestedInYouApiResponse==null?const Center(
        child: CircularProgressIndicator(),
      ):  SingleChildScrollView(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: SizeConstants.mediumPadding,
                  crossAxisSpacing: SizeConstants.mediumPadding,
                ),
                itemCount: controller.intrestedInYouApiResponse!.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return  ProfileCardWidget(
                    intrestedPersonData: controller.intrestedInYouApiResponse!.data[index],
                  );
                }),
          ),
        );
      }
    ),
  );
}