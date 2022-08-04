import 'package:flutter/material.dart';
import 'package:area_calculator/screens/area_calculator_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
          title: const Text('Area Caluclator'),
        ),
        body: const AreaCalculatorScreen(),
      ),
    );
  }
}
