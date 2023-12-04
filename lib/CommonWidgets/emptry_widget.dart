import 'package:dating_app/Utilities/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class EmptryWidget extends StatefulWidget {
  const EmptryWidget({super.key});

  @override
  State<EmptryWidget> createState() => _EmptryWidgetState();
}

class _EmptryWidgetState extends State<EmptryWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.all(SizeConstants.maximumPadding+SizeConstants.maximumPadding+SizeConstants.maximumPadding+SizeConstants.maximumPadding+SizeConstants.maximumPadding),
          child: Lottie.asset(
              'assets/json/empty.json',
            ),
        ));
  }
}
