import 'package:flutter/material.dart';
import 'music_player.dart';

void showModalBottom(BuildContext context) {
  showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      builder: (context) => Container(
          // padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          height: MediaQuery.of(context).size.height - 40,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 1),
                colors: <Color>[
                  Color(0xff1f005c),
                  Color(0xff5b0060),
                  Color(0xff870160),
                  Color(0xffac255e),
                  Color(0xffca485c),
                  Color(0xffe16b5c),
                  Color(0xfff39060),
                  Color(0xffffb56b),
                ], // Gradient from https://learnui.design/tools/gradient-generator.html
                tileMode: TileMode.mirror,
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
          child: MusicComponent()));
}


// Center(
//               child: Column(children: [
//                 Container(
//                   height: 3,
//                   width: 60,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(50)),
//                 ),
//                 Container(
//                   height: 400,
//                   // margin: EdgeInsets.symmetric(horizontal: 80),
//                   decoration: BoxDecoration(
//                       color: Colors.black, shape: BoxShape.circle),
//                 )
//               ]),
//             ),