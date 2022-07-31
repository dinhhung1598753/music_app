import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_app/components/custom_bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                    backgroundColor: Colors.black,
                    pinned: true,
                    floating: false,
                    expandedHeight: 270.0,
                    leading: Container(
                        // color: Colors.amber,
                        padding: EdgeInsets.all(15),
                        child:
                            FaIcon(FontAwesomeIcons.code, color: Colors.amber)),
                    flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Find the best music for your banger',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Padding(
                            padding: EdgeInsets.all(7),
                          ),
                          Container(
                              height: 45,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey[900],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide.none),
                                    hintText: 'Search',
                                    hintStyle: TextStyle(color: Colors.grey)),
                              )),
                          Padding(
                            padding: EdgeInsets.all(10),
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.amberAccent,
                                                  width: 3))),
                                      padding: EdgeInsets.all(5),
                                      child: Center(
                                          child: Text(
                                        'Commercial',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )))),
                              Expanded(
                                  child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey,
                                                  width: 1))),
                                      child: Center(
                                          child: Text(
                                        'Free license',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )))),
                            ],
                          ),
                          Padding(padding: EdgeInsets.all(5))
                        ],
                      ),
                    )),
                    actions: <Widget>[
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
                        tooltip: 'Search',
                        onPressed: () {/* ... */},
                      ),
                    ]),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final size = MediaQuery.of(context).size.width / 4;
                      return Container(
                          width: size,
                          height: size,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          decoration: new BoxDecoration(
                            color: Colors.red[400],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://icdn.dantri.com.vn/thumb_w/660/2021/06/09/chodocx-1623207689539.jpeg",
                                ),
                                fit: BoxFit.fitHeight,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.4),
                                    BlendMode.dstATop)),
                          ),
                          child: Center(
                            child: Text(
                              'circle',
                              style: TextStyle(color: Colors.black),
                            ),
                          ));
                    },
                    childCount: 20,
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomNavigationBar(),
            )
          ],
        ));
  }
}
