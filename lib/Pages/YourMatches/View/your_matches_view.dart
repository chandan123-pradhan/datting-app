import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Pages/YourMatches/View/its_match_view.dart';
import 'package:dating_app/Pages/YourMatches/Widgets/card_widget.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:flutter/material.dart';

class YourMatchesView extends StatefulWidget {
  const YourMatchesView({super.key});

  @override
  State<YourMatchesView> createState() => _YourMatchesViewState();
}

class _YourMatchesViewState extends State<YourMatchesView> {
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
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: SizeConstants.bigPadding,
            ),
            Text(
              StringConstants.matches,
              style: ThemeConfiguration.appBarTextStyle(),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                  child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const ItsMatchView();
                      }));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: index == 0 ? 20 : 0),
                      child: CardWidget(
                          img: 'assets/icons/messages_person_icon.png',
                          title: names[index],
                          context: context,
                          index: index),
                    ),
                  );
                },
              )),
            ))
          ],
        ),
      ),
    );
  }
}
