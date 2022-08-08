import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static double calculateBMI(double height, double weight, int unit) {
    double result;
    if (unit == 0) {
      result = (weight / height / height) * 10000;
    } else {
      result = (weight / height / height) * 703;
    }
    return result;
  }

  static void saveSettings(int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('unit', value);
  }

  static Future<int> getSettings() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int result = preferences.getInt('unit') ?? 0;
    return result;
  }
}
