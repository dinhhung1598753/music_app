import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_app/providers/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  int a = 1;
  @override
  Widget build(BuildContext context) {
    if (a == 1) context.read<HomeProvider>().getCategory();
    a++;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
            backgroundColor: Colors.black,
            pinned: true,
            floating: false,
            expandedHeight: 270.0,
            leading: Container(
                // color: Colors.amber,
                padding: EdgeInsets.all(15),
                child: FaIcon(FontAwesomeIcons.code, color: Colors.amber)),
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
                          borderRadius: BorderRadius.all(Radius.circular(20))),
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
                                'Category',
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
                                          color: Colors.grey, width: 1))),
                              child: Center(
                                  child: Text(
                                'Ranking',
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
                onPressed: () {
                  context.read<HomeProvider>().getCategory();
                },
              ),
            ]),
        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final size = MediaQuery.of(context).size.width / 4;
                final categories = context.watch<HomeProvider>().categories;
                return Container(
                    width: size,
                    height: size,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: new BoxDecoration(
                      // color: Colors.red[400],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          categories[index].thumbnail,
                        ),
                        fit: BoxFit.fitHeight,
                        // colorFilter: ColorFilter.mode(
                        //     Colors.black.withOpacity(0.4),
                        //     BlendMode.dstATop)
                      ),
                    ),
                    child: Center(
                      child: Text(
                        categories[index].title,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ));
              },
              childCount: context.watch<HomeProvider>().categories.length,
            ),
          ),
        ),
        SliverPadding(padding: EdgeInsets.all(80))
      ],
    );
  }
}
