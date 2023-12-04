import 'package:dating_app/Pages/InterestedInYou/Widgets/profile_card_widget.dart';
import 'package:dating_app/Utilities/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GridShimerWidget extends StatefulWidget {
  const GridShimerWidget({super.key});

  @override
  State<GridShimerWidget> createState() => _GridShimerWidgetState();
}

class _GridShimerWidgetState extends State<GridShimerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
     // color: Colors.blue,
     // height: MediaQuery.of(context).size.height/2,
     /// width: MediaQuery.of(context).size.width/1,
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            mainAxisSpacing: SizeConstants.mediumPadding,
            crossAxisSpacing: SizeConstants.mediumPadding,
          ),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 200,
              width: 200,
              child: Shimmer.fromColors(
                period: Duration(seconds: 2),
    baseColor: Colors.black45,
    highlightColor: Colors.blueGrey[100]!,
    child: Container
    (
      height: 200,
      width: 200,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
    )
  ),
            );
          }),
    );
  }
}
