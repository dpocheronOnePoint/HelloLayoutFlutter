import 'package:flutter/material.dart';
import 'package:navigation_app/art_route.dart';
import 'package:navigation_app/art_util.dart';

void main() {
  runApp(const MyTabBarApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigating art',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ArtRoute(art: ArtUtil.IMG_VANGOGH),
    );
  }
}

class MyTabBarApp extends StatelessWidget {
  const MyTabBarApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigating art',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Art Tab'),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.art_track),
                  text: ArtUtil.CARAVAGGIO,
                ),
                Tab(
                  icon: Icon(Icons.art_track),
                  text: ArtUtil.MONET,
                ),
                Tab(
                  icon: Icon(Icons.art_track),
                  text: ArtUtil.VANGOGH,
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(ArtUtil.IMG_CARAVAGGIO),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(ArtUtil.IMG_MONET),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(ArtUtil.IMG_VANGOGH),
                      fit: BoxFit.cover),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
