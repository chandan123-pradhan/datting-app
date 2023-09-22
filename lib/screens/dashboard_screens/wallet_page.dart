import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/string_utils.dart';
import 'package:dating_app/widgets/botton_widget.dart';
import 'package:dating_app/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
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
                TextWidgets.h5Text(text: StringUtils.WALLET)
              ],
            ),
          ),
          Expanded(
              child: Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  
                  children: [
                    const SizedBox(height: 20,),
                    Container(
                      height: 92,
                      width: MediaQuery.of(context).size.width / 1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: 1, color: ColorConstant.primaryColor)),
                    )
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
