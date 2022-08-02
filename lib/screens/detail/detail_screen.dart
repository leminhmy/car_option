import 'dart:math';

import 'package:car_option/screens/calendar/calendar_screen.dart';
import 'package:car_option/widget/big_text.dart';
import 'package:car_option/widget/label_text.dart';
import 'package:car_option/widget/small_text.dart';
import 'package:flutter/material.dart';
import 'package:imageview360/imageview360.dart';

import 'components/body_image360.dart';
import 'components/bottom_des_product.dart';
class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffccd9ef),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
             Positioned(
               top: -size.height * 0.1,
               child: const BodyImage360Car(),
             ),
            Positioned(
              top: size.height * 0.04,
              left: size.height * 0.01,
              child: Row(
                children: [
                  IconButton(onPressed: () => Navigator.pop(context),icon: Icon(Icons.arrow_back_ios_new)),
                  
                  SizedBox(width: size.height * 0.01,),
                  BigText(text: 'CAR DETAIL',color: Colors.black,fontSize: size.height * 0.025),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomDesProduct(size: size),
            ),

          ],
        ),
      ),
    );
  }
}


