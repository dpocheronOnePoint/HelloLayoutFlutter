import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:area_calculator/states/area_calculator_state.dart';
import 'package:area_calculator/widgets/shape_container.dart';
import 'package:area_calculator/widgets/area_textfield.dart';

class AreaCalculatorScreen extends StatefulWidget {
  const AreaCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<AreaCalculatorScreen> createState() => _AreaCalculatorScreenState();
}

class _AreaCalculatorScreenState extends State<AreaCalculatorScreen> {
  AreaCalculatorState areaCalculatorState = AreaCalculatorState();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
          margin: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: <Widget>[
              //dropdown
              DropdownButton<String>(
                  value: areaCalculatorState.currentShape,
                  items: areaCalculatorState.shapes.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 24.0),
                      ),
                    );
                  }).toList(),
                  onChanged: (shape) {
                    setState(() {
                      areaCalculatorState.currentShape = shape ?? 'Rectangle';
                    });
                  }),
              // Shape
              ShapeContainer(shape: areaCalculatorState.currentShape),
              //width
              AreaTextField(
                  controller: areaCalculatorState.widthController,
                  hint: 'Width'),
              //height
              AreaTextField(
                  controller: areaCalculatorState.heightController,
                  hint: 'Height'),
              Container(
                margin: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: areaCalculatorState.calculateArea,
                  child: const Text(
                    'Calculate Area',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              Text(
                areaCalculatorState.result,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.green[700],
                ),
              ),
            ],
          ));
    });
  }
}
