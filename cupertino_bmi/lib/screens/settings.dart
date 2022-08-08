import 'package:flutter/cupertino.dart';
import '../utils.dart';
import '../ui_constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int unit = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    const Map<int, Widget> systems = <int, Widget>{
      0: Text('Decimal'),
      1: Text('Imperial')
    };
    Utils.getSettings().then(updateControl);
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Settings"),
      ),
      child: SafeArea(
          child: Column(
        children: <Widget>[
          SizedBox(
            width: width,
            height: 200,
            child: Image.network(
              'https://i.picsum.photos/id/132/200/200.jpg?hmac=meVrCoOURNB7iKK3Mv-yuRrvxvXgv4h2vIRLM4sKwK4',
              fit: BoxFit.fill,
            ),
          ),
          UIConstants.paddingTop,
          Row(
            children: <Widget>[
              SizedBox(
                width: width,
                child: CupertinoSegmentedControl(
                  children: systems,
                  groupValue: unit,
                  onValueChanged: (int value) {
                    Utils.saveSettings(value);
                    updateControl(value);
                  },
                ),
              )
            ],
          )
        ],
      )),
    );
  }

  void updateControl(int value) {
    if (value != unit) {
      setState(() {
        unit = value;
      });
    }
  }
}
