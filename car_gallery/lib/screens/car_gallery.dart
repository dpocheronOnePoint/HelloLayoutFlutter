import 'package:flutter/material.dart';

class CarGallery extends StatelessWidget {
  const CarGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return SizedBox(
        width: sizeX,
        height: sizeY,
        child: GridView.count(
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          padding: const EdgeInsets.all(5),
          children: createGallery(50),
        ));
  }
}

List<Widget> createGallery(int numImages) {
  List<Widget> images = [];
  List<String> urls = [];
  urls.add(
      'https://i.picsum.photos/id/689/200/200.jpg?hmac=2KHWG2UlfLNAWC1jiBz-LQ7b-TMOB4bcW-FVvdQ_7a4');
  urls.add(
      'https://i.picsum.photos/id/492/200/200.jpg?hmac=XU2aUuiOp-6a1CXwWFsbEobU3xA-9upNSkJiJacygTM');
  urls.add(
      'https://i.picsum.photos/id/410/200/200.jpg?hmac=hVMLZXpDnTKOed7U0eNRwQvhs6LRl-g0XjEFRs4V3cU');
  urls.add(
      'https://i.picsum.photos/id/355/200/200.jpg?hmac=3rHDkz_9bWmvte4NNnIGZon7PIHrM6NQYzXtVY7M_UI');
  urls.add(
      'https://i.picsum.photos/id/715/200/200.jpg?hmac=eR-80S6YYIV9vV26EYLSVACDM5HWe94Oz2hx0icP5vI');

  Widget image;
  int i = 0;
  while (i < numImages) {
    image = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            urls[i % 5],
          ),
        ),
      ),
    );
    images.add(image);
    i++;
  }
  return images;
}
