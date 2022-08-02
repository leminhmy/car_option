import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ListColorThemeModel listColorThemeModel = MyThemes.whiteTheme;
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    if (isOn) {
      themeMode = ThemeMode.light;
      listColorThemeModel = MyThemes.whiteTheme;
    } else {
      themeMode = ThemeMode.dark;
      listColorThemeModel = MyThemes.blueTheme;
    }
    notifyListeners();
  }
}

class MyThemes {
  static final whiteTheme = ListColorThemeModel(
    shadow: const Color(0xffdbd4f7).withOpacity(0.5),
      text: Colors.black,
      colorBG: const Color(0xffccd9ef),
      colorIcon: Colors.black,
      lightBulb: Colors.black,
      bottomNavi: Colors.black12,
      btnBG: const Color(0xffbbb5d5),
      border: Colors.black12, filterBG: const Color(0xffe0dcf1),
      linearGradient: [Colors.white,
        Color(0xffdbd4f7),]
  );
  static final blueTheme = ListColorThemeModel(
      shadow: Colors.lightBlue.withOpacity(0.1),
      border: Colors.lightBlue,
      bottomNavi: Colors.black38,
      text: Colors.white,
      colorBG: const Color(0xff010f38),
      colorIcon: Colors.white,
      filterBG: Colors.lightBlue.withOpacity(0.1),
      lightBulb: Colors.yellow,
      btnBG: const Color(0x8c303160),
      linearGradient: [Colors.blue.withOpacity(0.2),const Color(0xff010f38)]);
}

class ListColorThemeModel {
  Color colorIcon;
  Color colorBG;
  Color text;
  Color lightBulb;
  Color bottomNavi;
  Color border;
  Color filterBG;
  Color shadow;
  Color btnBG;
  List<Color> linearGradient;

  ListColorThemeModel(
      {required this.border,
      required this.bottomNavi,
      required this.text,
        required this.linearGradient,
        required this.btnBG,
        required this.shadow,
        required this.filterBG,
      required this.colorBG,
      required this.colorIcon,
      required this.lightBulb});
}
