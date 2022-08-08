import 'package:cupertino_bmi/screens/bmi_screen.dart';
import 'package:cupertino_bmi/screens/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate
      ],
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: const [
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person,
              ),
              label: "BMI"),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.settings_solid,
              ),
              label: 'Settings')
        ]),
        tabBuilder: (BuildContext context, int i) {
          if (i == 0) {
            return const BMIScreen();
          } else {
            return const SettingsScreen();
          }
        });
  }
}
