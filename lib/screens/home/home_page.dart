import 'dart:math';

import 'package:car_option/widget/big_text.dart';
import 'package:car_option/widget/label_text.dart';
import 'package:car_option/widget/small_text.dart';
import 'package:car_option/widget/theme_button_swich.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';
import 'components/cuvred_bottom.dart';
import 'components/list_logo_row.dart';
import 'components/list_product_column.dart';
import 'components/list_product_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ListColorThemeModel listColorTheme = context.watch<ThemeProvider>().listColorThemeModel;
    return Scaffold(
      backgroundColor: listColorTheme.colorBG,

      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: size.height * 0.1,
              width: 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(size.height, size.height)),
                boxShadow: [
                  BoxShadow(
                    color: listColorTheme.filterBG,
                    blurRadius: 30,
                    offset: Offset(0,0),
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 270,
                  )
                ],
              ),
            ),
            SafeArea(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButtonChangeTheme(),
                        LabelText(text: 'SELECT CAR',color: listColorTheme.text),
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/avatar.jpg'),
                          maxRadius: 30,
                        )
                      ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(children: [
                      ListProductWidgetRow(size: size),
                      SizedBox(height: size.height * 0.02,),
                      ListLogoWidgetRow(size: size),
                      SizedBox(height: size.height * 0.02,),
                      ListProductWidgetColumn(size: size),
                      SizedBox(height: size.height * 0.15,),
                    ],),
                  ),
                ),
              
              ],
            )),

            Positioned(
              bottom: 0,
              child: CurvedBottom(size: size),
            )
          ],
        ),
      ),

    );
  }
}






