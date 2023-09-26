import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/string_utils.dart';
import 'package:dating_app/utils/text_styles.dart';
import 'package:dating_app/widgets/botton_widget.dart';
import 'package:dating_app/widgets/matches_person_widget.dart';
import 'package:dating_app/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
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
      backgroundColor: ColorConstant.backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width / 1,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    left: 20,
                    child: BottonWidgets.backBottonWidget(onTap: () {})),
                TextWidgets.h5Text(text: 'Your matches')
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: names.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:  EdgeInsets.only(
                        top: index==0? 
                           20:0),
                        child: matchesPersonWidget(
                            img: 'assets/icons/person_icon.png',
                            title: names[index],
                            context: context,
                            index: index
                            ),
                      );
                          
                    })),
          ))
        ],
      ),
    );
  }
}
