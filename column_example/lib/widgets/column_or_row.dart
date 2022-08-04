import 'package:flutter/material.dart';

class ColumnOrRowWidget extends StatelessWidget {
  const ColumnOrRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;

    return SizedBox(
      width: sizeX,
      height: sizeY,
      // Just choose Column or Row
      child: Column(
        // verticalDirection: VerticalDirection.up,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: createSquares(5),
      ),
    );
  }
}

List<Widget> createSquares(int numSquares) {
  int i = 0;
  List colors = [
    Colors.amber,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.indigo,
    Colors.lightBlue
  ];
  List<Widget> squares = [];
  while (i < numSquares) {
    Expanded square = Expanded(
        flex: i,
        child: Container(
          color: colors[i],
          // width: 60,
          // height: 60,
          child: Text(i.toString()),
        ));
    i++;
    squares.add(square);
  }
  return squares;
}
