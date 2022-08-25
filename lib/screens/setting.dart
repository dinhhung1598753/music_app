import 'package:flutter/material.dart';

const listTitle = ["#VietNam-Ranking", "#US-UK-RANKING", "#KOREA-RANKING"];

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, top: 20, right: 30),
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.white)),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22.0,
                backgroundImage: AssetImage('assets/images/no-avatar.jpg'),
                backgroundColor: Colors.transparent,
              ),
              Padding(padding: EdgeInsets.all(10)),
              Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ]),
    );
  }
}
