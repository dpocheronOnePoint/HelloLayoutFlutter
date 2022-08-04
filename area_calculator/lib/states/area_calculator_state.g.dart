// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_calculator_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AreaCalculatorState on AreaCalculatorStateBase, Store {
  late final _$currentShapeAtom =
      Atom(name: 'AreaCalculatorStateBase.currentShape', context: context);

  @override
  String get currentShape {
    _$currentShapeAtom.reportRead();
    return super.currentShape;
  }

  @override
  set currentShape(String value) {
    _$currentShapeAtom.reportWrite(value, super.currentShape, () {
      super.currentShape = value;
    });
  }

  late final _$resultAtom =
      Atom(name: 'AreaCalculatorStateBase.result', context: context);

  @override
  String get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(String value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  @override
  String toString() {
    return '''
currentShape: ${currentShape},
result: ${result}
    ''';
  }
}
