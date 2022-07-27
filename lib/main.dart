import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              backgroundColor: Colors.black,
              pinned: true,
              floating: false,
              expandedHeight: 270.0,
              leading: Icon(Icons.home),
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
                                            color: Colors.grey, width: 1))),
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
                  icon: const Icon(Icons.search),
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
                            "https://cdn.longkhanhpets.com/2019/08/tam-ly-loai-meo-1.jpg",
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(40))),
                    child: Column(children: []),
                  ));
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
        height: 140,
        color: Colors.white.withOpacity(0.25),
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
                  child: ListTile(
                    title: Text('abcs'),
                    subtitle: Text('xycs'),
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
    );
  }
}
