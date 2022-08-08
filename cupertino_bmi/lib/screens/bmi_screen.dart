import 'package:cupertino_bmi/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui_constants.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  int? unit;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('BMI'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: height * 0.8),
            child: Column(
              children: <Widget>[
                Image.network(
                  'https://i.picsum.photos/id/1035/200/200.jpg?hmac=IDuYUZQ_7a6h4pQU2k7p2nxT-MjMt4uy-p3ze94KtA4',
                  fit: BoxFit.fitWidth,
                ),
                UIConstants.paddingTop,
                Row(
                  children: <Widget>[
                    UIConstants.paddingLeft,
                    SizedBox(
                      width: width / 3,
                      child: const Text('Height'),
                    ),
                    Expanded(
                      child: CupertinoTextField(
                        controller: heightController,
                      ),
                    ),
                    UIConstants.paddingLeft
                  ],
                ),
                UIConstants.paddingTop,
                Row(
                  children: <Widget>[
                    UIConstants.paddingLeft,
                    SizedBox(
                      width: width / 3,
                      child: const Text('Weight'),
                    ),
                    Expanded(
                      child: CupertinoTextField(
                        controller: weightController,
                      ),
                    ),
                    UIConstants.paddingLeft
                  ],
                ),
                const Expanded(child: UIConstants.paddingTop),
                CupertinoButton.filled(
                  child: const Text('Calculate BMI'),
                  onPressed: () {
                    showResult();
                  },
                ),
                UIConstants.paddingTop
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showResult() async {
    double height;
    double weight;
    int unit = await Utils.getSettings();
    height = double.tryParse(heightController.text) ?? 0;
    weight = double.tryParse(weightController.text) ?? 0;

    double result = Utils.calculateBMI(height, weight, unit);
    String message = 'Yout BMI is ${result.toStringAsFixed(2)}';

    CupertinoAlertDialog dialog = CupertinoAlertDialog(
      title: const Text('Result'),
      content: Text(message),
      actions: <Widget>[
        CupertinoDialogAction(
          child: const Text('Ok'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }
}
