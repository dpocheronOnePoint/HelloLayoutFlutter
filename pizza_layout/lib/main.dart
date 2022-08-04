import 'package:flutter/material.dart';
import 'package:pizza_layout/pizza_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
            // brightness: Brightness.dark,
            primary: Colors.purple,
            secondary: Colors.orange),
        textTheme: const TextTheme(
          bodyText2: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Column or Row'),
        ),
        body: const PizzaLayout(),
      ),
    );
  }
}