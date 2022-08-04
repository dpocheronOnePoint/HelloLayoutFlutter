import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'area_calculator_state.g.dart';

class AreaCalculatorState = AreaCalculatorStateBase with _$AreaCalculatorState;

abstract class AreaCalculatorStateBase with Store {
  AreaCalculatorStateBase() {
    widthController.addListener(updateWidth);
    heightController.addListener(updateHeight);
  }

  List<String> shapes = ['Rectangle', 'Triangle'];

  @observable
  String currentShape = 'Rectangle';

  @observable
  String result = ('');

  double width = 0;

  double height = 0;

  final TextEditingController widthController = TextEditingController();

  final TextEditingController heightController = TextEditingController();

  void calculateArea() {
    double area;

    if (currentShape == 'Rectangle') {
      area = width * height;
    } else if (currentShape == 'Triangle') {
      area = width * height / 2;
    } else {
      area = 0;
    }
    result = 'The area is $area';
  }

  void updateWidth() {
    if (widthController.text != '') {
      width = double.parse(widthController.text);
    } else {
      width = 0;
    }
    print(width);
  }

  void updateHeight() {
    if (heightController.text != '') {
      height = double.parse(heightController.text);
    } else {
      height = 0;
    }
    print(height);
  }
}
