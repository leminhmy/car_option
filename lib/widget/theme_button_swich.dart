import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class IconButtonChangeTheme extends StatelessWidget {
  const IconButtonChangeTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    Color colorIcon = context.watch<ThemeProvider>().listColorThemeModel.lightBulb;
    bool value = context.watch<ThemeProvider>().themeMode == ThemeMode.light?true:false;
    return IconButton(
        onPressed: () {
          provider.toggleTheme(!value);
        },
        icon: Icon(
          Icons.lightbulb,
          color: colorIcon,
          size: size.height * 0.035,
        ));
  }
}
