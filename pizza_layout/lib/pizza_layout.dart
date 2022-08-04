import 'package:flutter/material.dart';

class PizzaLayout extends StatelessWidget {
  const PizzaLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return SizedBox(
      width: sizeX,
      height: sizeY,
      child: Stack(
        children: showPizzaLayout(sizeX, sizeY),
      ),
    );
  }
}

List<Widget> showPizzaLayout(double sizeX, sizeY) {
  List<Widget> layoutChildren = <Widget>[];
  Container backgroundContainer = Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: NetworkImage(
              'https://i.picsum.photos/id/392/500/500.jpg?hmac=IDJaWS3UnWgbQkqcGiJloXGZ6AqkAVk8O_ogApmWcIg'),
          fit: BoxFit.fitHeight),
    ),
  );
  layoutChildren.add(backgroundContainer);
  return layoutChildren;
}
