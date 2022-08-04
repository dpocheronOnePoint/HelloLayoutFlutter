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

  Positioned pizzaCard = Positioned(
    left: sizeX / 20,
    child: Card(
      elevation: 12,
      color: Colors.white70,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Text(
            "Pizza Margherita",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange[800]),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              "This delicious pizza is made of Tomato,\nMozzarella and Basil.\n\nSeriously you can't miss it !",
              style: TextStyle(fontSize: 18, color: Colors.grey[800]),
            ),
          )
        ],
      ),
    ),
  );
  layoutChildren.add(pizzaCard);

  Positioned buttonOrder = Positioned(
      bottom: sizeY / 20,
      left: sizeX / 20,
      width: sizeX - sizeX / 10,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.orange[900],
          elevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          "Order now !",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        onPressed: () {},
      ));
  layoutChildren.add(buttonOrder);
  return layoutChildren;
}
