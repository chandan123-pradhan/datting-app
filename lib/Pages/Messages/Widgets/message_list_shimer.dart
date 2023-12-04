import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MessageListShimer extends StatefulWidget {
  const MessageListShimer({super.key});

  @override
  State<MessageListShimer> createState() => _MessageListShimerState();
}

class _MessageListShimerState extends State<MessageListShimer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < 7; i++)
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Shimmer.fromColors(
                  period: const Duration(seconds: 2),
                  baseColor: Colors.black26,
                  highlightColor: Colors.blueGrey[50]!,
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 20,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
