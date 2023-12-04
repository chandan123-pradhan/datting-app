import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfileScreenShimer extends StatefulWidget {
  const ProfileScreenShimer({super.key});

  @override
  State<ProfileScreenShimer> createState() => _ProfileScreenShimerState();
}

class _ProfileScreenShimerState extends State<ProfileScreenShimer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width / 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              child: Shimmer.fromColors(
                  period: Duration(seconds: 2),
                  baseColor: Colors.black26,
                  highlightColor: Colors.blueGrey[100]!,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                        shape: BoxShape.circle),
                  )),
            ),
            SizedBox(height: 20,),
    
             Container(
              height: 200,
              width: MediaQuery.of(context).size.width/1,
              child: Shimmer.fromColors(
                  period: Duration(seconds: 2),
                  baseColor: Colors.black26,
                  highlightColor: Colors.blueGrey[100]!,
                  child: Container(
                    height: 200,
                   width: MediaQuery.of(context).size.width/1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                         color: Colors.blue,
                        ),
                  )),
            ),
             SizedBox(height: 20,),
    
             Container(
              height: 150,
              width: MediaQuery.of(context).size.width/1,
              child: Shimmer.fromColors(
                  period: Duration(seconds: 2),
                  baseColor: Colors.black26,
                  highlightColor: Colors.blueGrey[100]!,
                  child: Container(
                    height: 100,
                   width: MediaQuery.of(context).size.width/1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                         color: Colors.blue,
                        ),
                  )),
            ),
             SizedBox(height: 20,),
    
             Container(
              height: 150,
              width: MediaQuery.of(context).size.width/1,
              child: Shimmer.fromColors(
                  period: Duration(seconds: 2),
                  baseColor: Colors.black26,
                  highlightColor: Colors.blueGrey[100]!,
                  child: Container(
                    height: 100,
                   width: MediaQuery.of(context).size.width/1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                         color: Colors.blue,
                        ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
