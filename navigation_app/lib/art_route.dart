import 'package:flutter/material.dart';
import './art_util.dart';

class ArtRoute extends StatelessWidget {
  const ArtRoute({Key? key, required this.art}) : super(key: key);
  final String art;
  static int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://i.picsum.photos/id/263/200/200.jpg?hmac=M6XV5nVFFEhu9J37dng8WnB3jDTEi3AtqZm7E27mAaY'),
                    fit: BoxFit.fill),
              ),
              child: Text(
                'Choose your art',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text(ArtUtil.CARAVAGGIO),
              trailing: const Icon(Icons.art_track),
              onTap: () => changeRoute(context, ArtUtil.CARAVAGGIO),
            ),
            ListTile(
              title: const Text(ArtUtil.MONET),
              trailing: const Icon(Icons.art_track),
              onTap: () => changeRoute(context, ArtUtil.MONET),
            ),
            ListTile(
              title: const Text(ArtUtil.VANGOGH),
              trailing: const Icon(Icons.art_track),
              onTap: () => changeRoute(context, ArtUtil.VANGOGH),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Navigating Art"),
        actions: <Widget>[
          PopupMenuButton(
            icon: const Icon(Icons.image),
            itemBuilder: (BuildContext context) {
              return ArtUtil.menuItems.map(
                (String item) {
                  return PopupMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                },
              ).toList();
            },
            onSelected: (String value) => changeRoute(context, value),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(art), fit: BoxFit.cover),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.lime[900],
          currentIndex: _currentIndex,
          onTap: (value) {
            String _artist = ArtUtil.menuItems[value];
            _currentIndex = value;
            changeRoute(context, _artist);
          },
          items: const [
            BottomNavigationBarItem(
                label: ArtUtil.CARAVAGGIO, icon: Icon(Icons.art_track)),
            BottomNavigationBarItem(
                label: ArtUtil.MONET, icon: Icon(Icons.art_track)),
            BottomNavigationBarItem(
                label: ArtUtil.VANGOGH, icon: Icon(Icons.art_track))
          ]),
    );
  }

  void changeRoute(BuildContext context, String menuItem) {
    String image = '';
    switch (menuItem) {
      case ArtUtil.CARAVAGGIO:
        {
          image = ArtUtil.IMG_CARAVAGGIO;
          break;
        }
      case ArtUtil.MONET:
        {
          image = ArtUtil.IMG_MONET;
          break;
        }
      case ArtUtil.VANGOGH:
        {
          image = ArtUtil.IMG_VANGOGH;
          break;
        }
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArtRoute(art: image),
      ),
    );
  }
}
