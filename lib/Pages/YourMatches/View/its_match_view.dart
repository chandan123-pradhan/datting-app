import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Utilities/dialogs.dart';
import 'package:dating_app/Utilities/image_constants.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:flutter/material.dart';

class ItsMatchView extends StatefulWidget {
  const ItsMatchView({super.key});

  @override
  State<ItsMatchView> createState() => _ItsMatchViewState();
}

class _ItsMatchViewState extends State<ItsMatchView> {
  List<String> names = [
    'Kaushiki Dubey',
    'Nitish Kumar',
    'Vijay Kumar',
    'Minal Chaubey',
    'Priyanak Pandey',
    'Neelima Rajwar',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeConfiguration.scaffoldBgColor,
        body: Center(
          child: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageConstants.pupil,
                          height: 40,
                          width: 84,
                        ),
                        const SizedBox(
                          height: SizeConstants.matchProfileCardSize,
                        ),
                        const CircleAvatar(
                          radius: SizeConstants.matchProfileCardSize,
                          backgroundColor: ThemeConfiguration.scaffoldBgColor,
                          backgroundImage: NetworkImage(
                              'https://www.goodmorningimagesdownload.com/wp-content/uploads/2021/11/Free-Smart-Boy-Dp-Pics-Wallpaper-Pictures-Download-1.jpg'),
                        ),
                        const SizedBox(
                          height: SizeConstants.matchProfileCardSize,
                        ),
                        Image.asset(
                          ImageConstants.itAMatchView,
                          height: 84,
                          width: 124,
                        ),
                        const SizedBox(
                          height: SizeConstants.matchProfileCardSize,
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return const MainChatView();
                            // }));

                            Dialogs.coinsDeductionDialog(context);
                          },
                          child: Image.asset(
                            ImageConstants.chatNowBtn,
                            height: SizeConstants.buttonHeight,
                            width: MediaQuery.of(context).size.width / 1,
                          ),
                        ),
                        const SizedBox(
                          height: SizeConstants.maximumPadding,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            ImageConstants.keepSearchingBtn,
                            height: SizeConstants.buttonHeight,
                            width: MediaQuery.of(context).size.width / 1,
                          ),
                        ),
                      ]),
                ),
                const Positioned(
                  right: 40,
                  top: 200,
                  child: CircleAvatar(
                    radius: SizeConstants.matchProfileCardSize,
                    backgroundColor: ThemeConfiguration.scaffoldBgColor,
                    backgroundImage: NetworkImage(
                        'https://funylife.in/wp-content/uploads/2023/04/68_Cute-Girl-Pic-WWW.FUNYLIFE.IN_-1-1024x1024.jpg'),
                  ),
                ),
                // Positioned(
                //     top: 0,
                //     left: SizeConstants.mainPagePadding,
                //     child: CommonWidgets.backBottonWidget(onTap: () {
                //       Navigator.pop(context);
                //     })),
              ],
            ),
          ),
        ));
  }
}
