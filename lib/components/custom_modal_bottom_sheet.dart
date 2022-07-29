import 'package:flutter/material.dart';

void showModalBottom(BuildContext context) {
  showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      builder: (context) => Container(
            padding: EdgeInsets.all(40),
            height: MediaQuery.of(context).size.height - 40,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
            child: Column(children: []),
          ));
}
