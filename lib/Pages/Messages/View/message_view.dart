import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Pages/Messages/View/main_chat_view.dart';
import 'package:dating_app/Pages/Messages/Widgets/message_box_widget.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/screens/messages_screens/chat_screen.dart';
import 'package:flutter/material.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
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
              StringConstants.messages,
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
                  return Padding(
                    padding: EdgeInsets.only(top: index == 0 ? 20 : 0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const MainChatView();
                        }));
                      },
                      child: MessageBoxWidget(
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
