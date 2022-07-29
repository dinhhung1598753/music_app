import 'dart:ui';

import 'package:flutter/material.dart';

import 'custom_modal_bottom_sheet.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Container(
          height: 140,
          color: Color(0xff353838).withOpacity(0.9),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(children: [
                  CircleAvatar(
                    radius: 22.0,
                    backgroundImage: NetworkImage(
                        "https://cafefcdn.com/thumb_w/650/203337114487263232/2022/3/3/photo1646280815645-1646280816151764748403.jpg"),
                    backgroundColor: Colors.transparent,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showModalBottom(context);
                      },
                      child: ListTile(
                        title: Text('abcs'),
                        subtitle: Text('xycs'),
                      ),
                    ),
                  ),
                  Icon(Icons.play_arrow),
                  Icon(Icons.close)
                ]),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.black),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.amber,
                        ),
                        Text(
                          'acb',
                          style: TextStyle(color: Colors.amber, fontSize: 8),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        Text(
                          'acb',
                          style: TextStyle(color: Colors.white, fontSize: 8),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        Text(
                          'acb',
                          style: TextStyle(color: Colors.white, fontSize: 8),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        Text(
                          'acb',
                          style: TextStyle(color: Colors.white, fontSize: 8),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
